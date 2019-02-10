//
//  Constants.swift
//  SwiftAssessment
//
//  Created by MOHAMMED IMRAN on 2/7/19.
//  Copyright © 2019 MOHAMMED IMRAN. All rights reserved.
//

import Foundation

/// Constants to set the request timeout during service call.
public struct Constants {
    public static let kRequestTimeOut = 30
}
struct DetailView{
    static let PlaceholderImageName = "Placeholder"
}
/// The purpose of the `ServiceUrl` is identify the type of the service URL being used for services
/// - Parameter: BaseURL Contains the base url
/// - Parameter: passTimes url
struct ServiceUrl {
    static let BaseURL = "https://api.nytimes.com/svc/topstories/v2/science.json?"
    static let getNewsData = "api-key=IxEwCxmMDoR10zfapRTpBCS9hcXSGVXG"
}
