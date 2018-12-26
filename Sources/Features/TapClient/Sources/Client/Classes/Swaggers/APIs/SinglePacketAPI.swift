//
// SinglePacketAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class SinglePacketAPI {
    /**
     Execute (after validation) a big Single Packet previously sent to the TAP using BSPP.
     
     - parameter data: (body)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func bspe(data: Bytes? = nil, completion: @escaping ((_ data: Bytes?,_ error: Error?) -> Void)) {
        bspeWithRequestBuilder(data: data).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Execute (after validation) a big Single Packet previously sent to the TAP using BSPP.
     - POST /single-packet/bspe
     - Execute (after validation) a big Single Packet previously sent to the TAP using BSPP.  Stored packet is erased after packet is executed. (even if failed to execute) This command contains some control information (size, hash, CRC, salt, etc.) TBD
     - examples: [{contentType=application/json, example=""}]
     
     - parameter data: (body)  (optional)

     - returns: RequestBuilder<Bytes> 
     */
    open class func bspeWithRequestBuilder(data: Bytes? = nil) -> RequestBuilder<Bytes> {
        let path = "/single-packet/bspe"
        let URLString = ClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: data)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Bytes>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Get information concerning Single Packet Store Status
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getInfo(completion: @escaping ((_ data: Bytes?,_ error: Error?) -> Void)) {
        getInfoWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get information concerning Single Packet Store Status
     - GET /single-packet-store/info
     - Get information concerning Single Packet Store Status : Does this TAP provide the Single Packet Store ? (SPS) Is the store empty, full or halfway ? Details about the the execution of the last executes SP ?
     - examples: [{contentType=application/json, example=""}]

     - returns: RequestBuilder<Bytes> 
     */
    open class func getInfoWithRequestBuilder() -> RequestBuilder<Bytes> {
        let path = "/single-packet-store/info"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Bytes>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Send a partial Single Packet to the TAP.
     
     - parameter data: (body)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func writePartialSinglePacket(data: Bytes? = nil, completion: @escaping ((_ data: Bytes?,_ error: Error?) -> Void)) {
        writePartialSinglePacketWithRequestBuilder(data: data).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Send a partial Single Packet to the TAP.
     - POST /single-packet/part
     - Size of the packet = 130 bytes : 2 bytes offset, 128 bytes packet part. Stored packet is erased when packet part 0 is received.
     - examples: [{contentType=application/json, example=""}]
     
     - parameter data: (body)  (optional)

     - returns: RequestBuilder<Bytes> 
     */
    open class func writePartialSinglePacketWithRequestBuilder(data: Bytes? = nil) -> RequestBuilder<Bytes> {
        let path = "/single-packet/part"
        let URLString = ClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: data)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Bytes>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Send a complete Small Single Packet to the TAP. Size of the packet < 120 bytes
     
     - parameter data: (body)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func writeSmallSinglePacket(data: Bytes? = nil, completion: @escaping ((_ data: Bytes?,_ error: Error?) -> Void)) {
        writeSmallSinglePacketWithRequestBuilder(data: data).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Send a complete Small Single Packet to the TAP. Size of the packet < 120 bytes
     - POST /single-packet/write
     - 
     - examples: [{contentType=application/json, example=""}]
     
     - parameter data: (body)  (optional)

     - returns: RequestBuilder<Bytes> 
     */
    open class func writeSmallSinglePacketWithRequestBuilder(data: Bytes? = nil) -> RequestBuilder<Bytes> {
        let path = "/single-packet/write"
        let URLString = ClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: data)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Bytes>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}
