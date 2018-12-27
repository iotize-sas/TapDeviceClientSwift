//
//  Copyright 2018 IoTize SAS Inc.  Licensed under the MIT license. 
//
//  BLEPeripheral.swift
//  device-com-ble.cordova BLE Cordova Plugin
//

import Foundation
import CoreBluetooth
import IotizeCore

//Serial Data transmission using a queue of requests
class Request: NSObject{
	
    //transmitted data
    let txData: [UInt8]
    
    //received data
    var rxData: [UInt8]?
    
    //request has been canceled
    var cancelled : Bool

    //callbakc to send back the received data
    let completion: CompletionWithResponse
    
    static let waitingTimeInterval: Double = 0.001
    
    init(txData: [UInt8], completion: @escaping CompletionWithResponse) {
        self.txData = txData
        self.completion = completion
        self.cancelled = false
    }
    
    //wait loop for response from device
    public func waitForResponse(){
        DispatchQueue.global().async {
            for _ in 1...2000 { // 2s timeout
                if (self.cancelled) {
                    return
                }
                //received data return the result to the application
                if ( self.rxData != nil ) {
                    self.completion(self.rxData!,nil)
					print("---------------------- received answer \(self.rxData?.hexstr ?? "!EMPTY!")")
                    return
                }
                Thread.sleep(forTimeInterval: Request.waitingTimeInterval)
            }
            //timed out
            self.completion( "", IoTizeBleError.TimedOutRequest(msg: self.txData.hexstr))
            self.cancelled = true;
        }
    }

    //helper function 
    public static func stringToHexArray(_ string: String) -> [UInt8]{
        var stest = string.map { String($0) }
        var finalArray = [UInt8]()
        
        for i in 0..<stest.count/2{
            let string = stest[2*i...2*i+1].joined()
            let value = UInt8(string, radix: 16)
            finalArray.append(value!)
        }
        
        return finalArray
    }
	
}

//Peripheral class
class BLEPeripheral:  NSObject, CBPeripheralDelegate{
    
    public var bleDevice: CBPeripheral!
    private var bleManager: BLEManager!
    
    //a queue of commands waiting to be transmitted
    private var requestQueue = Queue<Request>()
    private var currentRequest : Request?
    
    //notify mode
    private var notifyCharacteristic: CBCharacteristic!
    private var notifyCharacteristicResponseType: CBCharacteristicWriteType!
    
    private var lastError: IoTizeBleError?
    
    // SPP over BLE Service UUID (128-bit)
    private let SPPoverLE_SERVICE_UUID = CBUUID(string: "6C7B16C2-2A5B-8C9F-CF42-D31425470E7B")
    private let SPPoverLE_BUFFER_CHAR_UUID = CBUUID(string: "cc5c5491-b3be-9287-cb42-f7a6a29a50d5")
    
    // OTA firmware version Service UUID (128-bit)
    private let UUID_UPGRADE_SERVICE = CBUUID(string: "9e5d1e47-5c13-43a0-8635-82ad38a1386f");
    private let UUID_UPGRADE_APP_INFO = CBUUID(string: "347f7608-2e2d-47eb-913b-75d4edc4de3b");
    
    //device ble firmware version
    private var bleVersion: String="0.0";
    
    private static var bufferLength = 300
    private var flagDataAvailable = false
    
    //transmission buffer
    private var rxBuffer = [UInt8](repeating: 0, count: bufferLength)
    private var rxBufferLength = 0
    
    //reception buffer
    private var txBuffer = [UInt8](repeating: 0, count: bufferLength)
    private var txBufferLength = 0
    private var txBufferRest = 0
    private var currentTxPacket = 0
    
    //request transmission has been cancelled
    private var cancelling: Bool = false

    //wait until the device is ready to transmit data
    private var isReady: Bool = false
    
    private static var minMajor = 1
    private static var minMinor = 9
    
    private static var LEN_PACKET = 19         // MTU = 23 - 3 - 1 num packet
    private let requestQueueManagementDelay = 0.002
    
    override init(){
        super.init()
        DispatchQueue.global(qos: .background).async {
            self.manageRequestQueue()
        }
    }
    
    func connect( device: CBPeripheral, manager: BLEManager){
        bleManager = manager
        lastError = nil
        bleDevice = device
        bleDevice.delegate = self
        bleDevice.discoverServices([UUID_UPGRADE_SERVICE, SPPoverLE_SERVICE_UUID])
    }
    
    func disconnect(){
        
        //cleanup
        self.cancelRequests()
        
        bleDevice = nil
        bleManager = nil
    }
    
    func checkConnection(completion: @escaping Completion){
        completion(lastError)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?){
        if let error = error{
            lastError = IoTizeBleError.ServiceDiscoveryFailed(peripheral: peripheral)
            return
        }
        
        for service in peripheral.services!{
            if service.uuid == UUID_UPGRADE_SERVICE{
                peripheral.discoverCharacteristics([UUID_UPGRADE_APP_INFO], for: service)
            }
            
            if service.uuid == SPPoverLE_SERVICE_UUID{
                peripheral.discoverCharacteristics([SPPoverLE_BUFFER_CHAR_UUID], for: service)
                
            }
        }
    }

    //characteristics callback 
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?){
        if error != nil {
            lastError = IoTizeBleError.CharacteristicsDiscoveryFailed(peripheral:  peripheral)
            return
        }
        
        for characteristic in service.characteristics!{
            
            if characteristic.uuid == SPPoverLE_BUFFER_CHAR_UUID{
                notifyCharacteristic = characteristic
                bleDevice?.setNotifyValue(true, for: notifyCharacteristic)
                notifyCharacteristicResponseType = CBCharacteristicWriteType.withResponse
                
                if (characteristic.properties.rawValue & CBCharacteristicProperties.writeWithoutResponse.rawValue) != 0{
                    notifyCharacteristicResponseType = CBCharacteristicWriteType.withoutResponse
                }
                self.isReady = true;
            }
            
            // Get the Broadcom firmware version
            if characteristic.uuid == UUID_UPGRADE_APP_INFO{
                bleDevice?.readValue(for: characteristic)
            }
        }
        
        if ( notifyCharacteristic == nil ){
            lastError = IoTizeBleError.CharacteristicSPPNotFound(peripheral: peripheral)
        }
        
    }
    
    //notify 
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?){
        if error != nil {
            lastError = IoTizeBleError.CharacteristicNotifyChangeFailed()
            return
        }
    }
    
    //with response callback
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?){
        if error != nil {
            lastError = IoTizeBleError.InvalidWriteData(peripheral:  peripheral)
            return
        }
        else{
            if ( currentTxPacket > 0){
                currentTxPacket = currentTxPacket - 1
                send_one_TX_Packet(currentTxPacket)
            }
        }
    }
    
    //Data is received in several packets
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?){
        if error != nil {
            return
        }
        
        let data = [UInt8](characteristic.value!)
        
        //ble firmware version
        if (characteristic.uuid == UUID_UPGRADE_APP_INFO){
            let major = Int(data[2])
            let minor = Int(data[3])
            bleVersion = "\(major).\(minor)"
            if (!isFirmwareUpToDate(major,minor, BLEPeripheral.minMajor, BLEPeripheral.minMinor)){
                lastError = IoTizeBleError.BleVersionIsOld(version: bleVersion)
            }
            return
        }
        
        //data
        if (characteristic.isEqual(notifyCharacteristic) != true) || (data.count <= 0){
            return
        }
        
        rxBufferLength += (data.count - 1)
        
        if (rxBufferLength > BLEPeripheral.bufferLength){
            rxBufferLength = BLEPeripheral.bufferLength
        }
        
        let offset = Int(data[0] & 0xFF) - 1
        if ((offset + data.count) < BLEPeripheral.bufferLength){
            rxBuffer.replaceSubrange((offset + 1)..<(offset + data.count), with: data[1..<data.count])
        }
        
        //end of packet is signaled with offset value set to -1
        if (offset == -1){
            var checksum : UInt8 = 0
            
            // Remove checksum to length
            rxBufferLength = rxBufferLength - 1
            
            // Compute checksum
            var tmp : UInt = 0
            for i in 0..<rxBufferLength{
                tmp = tmp + UInt(rxBuffer[i])
            }
            
            // Test checksum
            checksum = UInt8(tmp & 0xFF);
            if (checksum != rxBuffer[rxBufferLength]){
                rxBuffer[rxBufferLength - 2] = 0x66
                rxBuffer[rxBufferLength - 1] = 0x02
            }
            
            if (currentRequest != nil){
                currentRequest!.rxData = Array(rxBuffer.prefix(rxBufferLength))
                currentRequest = nil
            }
            
            flagDataAvailable = true
        }
    }
    
    
    func SendRequest(_ data: [UInt8]){
        rxBufferLength = 0
        flagDataAvailable = false
        send_All_TX_Packets(data)
    }
    
    func send( data: [UInt8], completion: @escaping CompletionWithResponse){
        let req = Request(txData: data,completion: completion)
        requestQueue.enqueue(req);
    }
    
    func send_All_TX_Packets(_ data: [UInt8]){
        var chksum : UInt8 = 0
        if (data.count > 0){
            txBufferLength = data.count;
            txBuffer = Array(data[0..<txBufferLength])
            
            // Compute check sum
            var tmp : UInt = 0
            for i in 0..<txBufferLength{
                tmp = tmp + UInt(txBuffer[i])
            }
            
            chksum = UInt8(tmp & 0xFF)
            txBuffer.append(chksum)
            txBufferLength = txBufferLength + 1
            
            // Compute number of packet to send
            currentTxPacket = txBufferLength / BLEPeripheral.LEN_PACKET
            txBufferRest = txBufferLength % BLEPeripheral.LEN_PACKET
            
            if (txBufferRest == 0){
                currentTxPacket = currentTxPacket - 1
                txBufferRest = BLEPeripheral.LEN_PACKET
            }
            send_one_TX_Packet(currentTxPacket)
            
            //send without response we can send 
            if (notifyCharacteristicResponseType == CBCharacteristicWriteType.withoutResponse) {
                while ( currentTxPacket > 0){
                        currentTxPacket = currentTxPacket - 1
                        send_one_TX_Packet(currentTxPacket)
                }
            }                       
        }
    }
    
    // Send one packet of BLE frame
    func send_one_TX_Packet(_ num : Int)
    {
        var len : Int
        var offset : Int
        
        // Check if last packet
        if (num > 0){
            offset = txBufferRest + ((num - 1) * BLEPeripheral.LEN_PACKET)
            len = BLEPeripheral.LEN_PACKET
        }
        else{
            offset = 0;
            len = txBufferRest
        }
        
        var packet = [UInt8](repeating: 0, count : len + 1)
        packet[0] = UInt8(offset)
        for i in 0..<len{
            packet[i + 1] = txBuffer[offset + i]
        }
        
        if (notifyCharacteristic != nil && notifyCharacteristicResponseType != nil) {
            bleDevice.writeValue(Data(packet), for: notifyCharacteristic!, type: notifyCharacteristicResponseType!)
        }
        
    }
    
    // Implement a rule to check if the current device's firmware is up to date versus check version
    func isFirmwareUpToDate(_ curMajor: Int, _ curMinor : Int, _ checkMajor : Int, _ checkMinor : Int) -> Bool{
        return ((curMajor > checkMajor) || ((curMajor == checkMajor) && (curMinor >= checkMinor)))
    }
    
    // Thread handling requests in serial 
    @objc func manageRequestQueue() {
        repeat {
            if let currentRequest = self.currentRequest {
                if currentRequest.cancelled {
                    self.currentRequest = nil
                }
            }
            //if we are not waiting for a response and we have something to send
            if (isReady && !self.cancelling && (self.currentRequest == nil) && !requestQueue.isEmpty){
                let request = requestQueue.dequeue()!
                self.rxBufferLength = 0
                self.flagDataAvailable = false
                self.currentRequest = request
                print("---------------------- send \(request.txData)")
                self.send_All_TX_Packets(request.txData)
                request.waitForResponse()
                
            }
            Thread.sleep(forTimeInterval: self.requestQueueManagementDelay)
            
        } while true
    }
    
    //cancel all when disconnecting
    func cancelRequests() {
        self.cancelling = true;
        while (requestQueue.count > 0) {
            guard let request = requestQueue.dequeue() else {
                break
            }
            request.cancelled = true
            Thread.sleep(forTimeInterval: Request.waitingTimeInterval * 1.5)
        }
        self.cancelling = false
    }
    
    func getNotifyCharacteristicResponseType() -> CBCharacteristicWriteType? {
        return self.notifyCharacteristicResponseType
    }
}
