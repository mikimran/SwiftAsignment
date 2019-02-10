//
//  ServiceManager.swift
//  SwiftAsignmentTests
//
//  Created by MOHAMMED IMRAN on 2/9/19.
//  Copyright © 2019 MOHAMMED IMRAN. All rights reserved.
//

import UIKit

/**
 The purpose of the `ServiceIdentifier` is identify the service identifier when multiple service being called
 */
public enum ServiceIdentifier {
    case getNews
}

/**
 ServiceType to identify the type of the service being called.
 */
public enum ServiceType: String {
    case GET
    case POST
    case PUT
    case DELETE
}

class ServiceManager{
    
    static let sharedInstance = ServiceManager()
    
    func getNewsList(_ completion: @escaping (_ response:AnyObject?)->(),
                      onError: @escaping (_ error:Error)->()) {
        
        let newsURL =  ServiceUrl.getNewsData
        let getNewsService = BaseService(serviceIdentifier: .getNews, serviceType: .GET, serviceURL: newsURL)
        getNewsService.start(success: { (responseData) in
        
            do {
                
                let getNews = try JSONDecoder().decode(NewsData.self, from: responseData as! Data)
                completion(getNews as AnyObject)
                
            } catch {
                print(error.localizedDescription)
                onError(error)

            }
            
            
        }) { (error) in
            onError(error)
        }
        
    }
}

