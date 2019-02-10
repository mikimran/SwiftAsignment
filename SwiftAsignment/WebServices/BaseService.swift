//
//  BaseService.swift
//  SwiftAssessment
//
//  Created by MOHAMMED IMRAN on 2/7/19.
//  Copyright © 2019 MOHAMMED IMRAN. All rights reserved.
//
import UIKit

enum HTTPStatusCodes: Int {
    // 200 Success
    case OK = 200
    // 400 Client Error
    case BadRequest = 400
    // 500 Server Error
    case InternalServerError = 500
}


class BaseService: NSObject {
    
    var serviceIdentifier: ServiceIdentifier!
    var serviceType: ServiceType!
    var requestBody: [String:AnyObject] = ["":"" as AnyObject]
    var serviceURL:String = ""
    
    
    ///  Initializer to set the default properities which are being set
    /// - parameter: Takes serviceIdentifier input parameter to identify the service identifier when multiple service being called
    /// - parameter: Takes serviceType input parameter of service type get/put/post
    /// - parameter: Takes serviceURL input parameter api url
    /// - parameter: Takes requestData input parameter
    public convenience init(serviceIdentifier: ServiceIdentifier, serviceType:ServiceType, serviceURL: String, requestData: Data? = nil) {
        self.init()
        self.serviceIdentifier = serviceIdentifier
        self.serviceType = serviceType
        if let requestData = requestData, let requestBody = Utilities.convertToDict(data: requestData) {
            self.requestBody = requestBody
        }
        //self.delegate = delegate
        self.serviceURL = serviceURL
    }
    
    /// This method will make an Service call with all the Http url, headers, body and session
    open func start(success:@escaping (_ response: AnyObject) -> Void,
                    failure: @escaping (_ error: NSError) -> Void) -> Void {

        let url:String = ServiceUrl.BaseURL + serviceURL
        var request: URLRequest = URLRequest(url: URL(string: url)!)
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TimeInterval(Constants.kRequestTimeOut)

        let session :Foundation.URLSession = URLSession(configuration: configuration, delegate: self as? URLSessionDelegate, delegateQueue: OperationQueue.main)
       
        request.httpMethod = serviceType.rawValue
        if serviceType != .GET {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        print("request : \(request)")
        let dataTask = session.dataTask(with: request, completionHandler: {
            data, response, error -> Void in
            if let error = error {
                print("error \(String(describing: error))")
                failure(error as NSError)
            }
            else
            {
                let httpResponse = response as! HTTPURLResponse
                
                switch httpResponse.statusCode{
                    
                    case 200:
                        success(data as AnyObject)
                        break
                    case 400:
                        failure(error! as NSError)
                        break
                    case 500:
                        failure(error! as NSError)
                        break
                    default:
                        success(data as AnyObject)
                }
                
            }
        })
        dataTask.resume()
    }
}

