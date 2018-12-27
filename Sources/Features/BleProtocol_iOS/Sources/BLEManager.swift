//
//  Copyright 2018 IoTize SAS Inc.  Licensed under the MIT license. 
//
//  BLEManager.swift
//  device-com-ble.cordova BLE Cordova Plugin
//

import CoreBluetooth

//Callback type,  methods with no returned value
typealias Completion = (IoTizeBleError?) -> ()

//Callback type, methods with returning values
typealias CompletionWithResponse = (Any , IoTizeBleError?) -> ()

//Central manager handling devices and ble callbacks.
class BLEManager: NSObject, CBCentralManagerDelegate
{
    //ios BLE central manager
    private var centralManager: CBCentralManager!
    
    //IoTize devices are filtered using the UUID of the service used for data exchange
    let serviceUUID = CBUUID(string: "6C7B16C2-2A5B-8C9F-CF42-D31425470E7B")
    
    var discoveredPeripherals = [CBPeripheral]()        //list of discovered devices
    var blestateChangeCompletion: Completion?           //callback called when the ble state is changing
    var connectionChangeCompletion: Completion?         //callback called when the ble connection states is changing
    var disconnectionErrorCompletion: Completion?       //callback called when a device is disconnected erroneously
    var discoveryCompletion: CompletionWithResponse?    //callback called when a new device is discovered
    
    //currently connected device
    private var connectedDevice: BLEPeripheral?
    
    override init(){
        super.init()
        
        centralManager = CBCentralManager(delegate: self, queue: nil, options: [CBCentralManagerOptionShowPowerAlertKey: true])
        
        //Initializations
        blestateChangeCompletion = nil
        connectionChangeCompletion = nil
        disconnectionErrorCompletion = nil
        connectedDevice = nil
        discoveryCompletion = nil
    }
       
    
    // Start Scanning Iotize devices
    func beginScan(completion: @escaping CompletionWithResponse){
        print("--> Start Scanning")
        if #available(iOS 10.0, *) {
            if (centralManager.state == CBManagerState.poweredOn){
                discoveryCompletion = completion
                discoveredPeripherals.removeAll()
                centralManager.scanForPeripherals(withServices: [serviceUUID], options: nil)
                
               
                discoveryCompletion!("Ok", nil)
            } else {
                print("<-- BLE not enabled")
            }
        } else {
                print("<-- no BLE capability")
        }
    }
    
    // Stop Scanning devices
    func stopScan(){
        print("--> Stop Scanning")
        centralManager.stopScan()        
    }
    
    // Connection with a device
    func connect(_ device: CBPeripheral){
        print("--> Start Connecting")
        
        //stop scanning first
        centralManager.stopScan()
        
        //disconnect the currently selected device first
        if (connectedDevice == nil){
            connectedDevice = BLEPeripheral()
        } else {
            connectedDevice!.disconnect()
        }

        centralManager.connect(device, options: nil)
    }
    
    // Connection to a device using its UUID. ios GATT uses UUID in spite of MAC address
    func connectWithUUID( device: String, completion: @escaping Completion){
        print("--> Start Connecting with UUID")
        
        //stop scanning first
        centralManager.stopScan()
        
        //save callback methods
        connectionChangeCompletion = completion
        disconnectionErrorCompletion = completion
        
        //in ios the device should be scanned in order 
        //to enable connection
        for item : CBPeripheral in discoveredPeripherals{
            
            let name = item.identifier.uuidString
            if (name != nil) {
                
                if (name == device){
                    
                    connect(item)
                    break;
                    
                }
            }
        }
    }
    
    // Disconnect from the currently selected device
    func disconnect( completion: @escaping Completion){
        print("--> Start Disconnecting")

        //save callback method 
        connectionChangeCompletion = completion
        
        if ( connectedDevice != nil ){
            if connectedDevice!.bleDevice != nil {
                centralManager.cancelPeripheralConnection(connectedDevice!.bleDevice)
            }
            connectedDevice!.disconnect()
            connectedDevice = nil
        }
    }
  
    //BLE state changing
    func centralManagerDidUpdateState (_ central: CBCentralManager){
        var error: IoTizeBleError?
        switch centralManager.state{
        case .poweredOn:
            break
        case .poweredOff:
            error = IoTizeBleError.BlePoweredOff()
            break
        case .resetting:
            error = IoTizeBleError.BleResetting()
            break
        case .unauthorized:
            error = IoTizeBleError.BleUnauthorized()
            break
        case .unsupported:
            error = IoTizeBleError.BleUnsupported()
            break
        case .unknown:
            error = IoTizeBleError.BleUnknown()
            break
            
        }
        
        //call the calleback to notify the app, 
        //this call back is used only 
        if (self.blestateChangeCompletion != nil){
            self.blestateChangeCompletion!(error)
            self.blestateChangeCompletion = nil
        }
    }
    
    //Called when a new device has been detected
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber){
        //do we know this device
        if (!discoveredPeripherals.contains(peripheral)){
            //do we have a name
            if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String{
                print("### Did discover \(name)")
                //add peripheral to the table
                discoveredPeripherals.append(peripheral)  
                //call the discovery callback
                if ( discoveryCompletion != nil){
                    discoveryCompletion!(
                        CBPeripheralConverter.toDiscoveredDeviceType(device: peripheral, rssi: RSSI as? Int)
                        , nil)
                }
            }
        }
    }
        
    //Called when a connection has been established
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral){
        
        print("### Did connect \(String(describing: peripheral.name))")
        if ( connectionChangeCompletion != nil){
            
            if (connectedDevice != nil){
                connectedDevice!.connect(device: peripheral, manager: self)            
            }

            //callback without error
        
                connectionChangeCompletion!(nil)
                connectionChangeCompletion = nil
                    
        }
    }
    
    //Called when connection fails
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?){
        
        print("### Error in connecting to device. Error: \(String(describing: error?.localizedDescription))")
        
        //callback with error
        if ( connectionChangeCompletion != nil){
            connectionChangeCompletion!(IoTizeBleError.PeripheralConnectionFailed(peripheral: peripheral, error: error))
            connectionChangeCompletion = nil
        }
        connectedDevice = nil
    }
    
    
    //Called when disconnected
    func centralManager (_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?){
        
        print("### Did disconnect from device: \(String(describing: peripheral.name))")
               
        //callback without error, if we have requested this disconnection
        if ( connectionChangeCompletion != nil){
            connectionChangeCompletion!(nil)
            connectionChangeCompletion = nil
            return
        }
        
        // Unwanted disconnection (e.g. peripheral out of range or powered off)
        if (disconnectionErrorCompletion != nil) {
            print("### Did Unwanted disconnection from device: \(String(describing: peripheral.name))")       
            disconnectionErrorCompletion!(IoTizeBleError.PeripheralConnectionFailed(peripheral: peripheral, error: error))
            disconnectionErrorCompletion = nil
        } 

        connectedDevice = nil
    }
    
    func checkConnection(completion: @escaping Completion){
        if (connectedDevice == nil){
            
            completion(IoTizeBleError.NoDeviceConnected())
        }else {
            connectedDevice!.checkConnection( completion:  completion )
        }
    }
    
    func sendRequest(data: [UInt8], completion: @escaping CompletionWithResponse){
        if (connectedDevice == nil){
            completion("",IoTizeBleError.NoDeviceConnected())
        }else {
            connectedDevice!.send(data: data, completion: completion)
        }
    }
    
    func isReady() -> Bool {
        return centralManager.state == .poweredOn
    }
    
    func getNotifyCharacteristicResponseType() -> CBCharacteristicWriteType? {
        if (self.connectedDevice == nil) {
            return nil
        }
        return self.connectedDevice!.getNotifyCharacteristicResponseType()
    }
    
    func isConnected() -> Bool {
        return self.connectedDevice != nil
    }
    
    
    func checkState(completion: @escaping Completion){
        blestateChangeCompletion = completion    
    }
}
