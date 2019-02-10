//
//  Utilities.swift
//  SwiftAssessment
//
//  Created by MOHAMMED IMRAN on 2/7/19.
//  Copyright © 2019 MOHAMMED IMRAN. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    
    ///   The purpose of the `convertToDict` is to convert to Dict from Data type
    /// - parameter: Data takes input parameter
    /// - Returns: Returns json formate or nil
    class func convertToDict(data: Data?) -> [String: AnyObject]? {
        do {
            if let data = data {
                return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject]
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    class func splitstring(withstring : String) -> String {
        
        if withstring.count>10{
            let index = withstring.index(withstring.startIndex, offsetBy: 10)
            let mySubstring = withstring.prefix(upTo: index)
            return String(mySubstring)
        }
        else{
          return ""
        }}
}

///    The purpose of the `String` extension to localize the string being used
/// - parameter: Takes input string parameter
/// - Returns: localized string name
extension String {
    func localized(withComment: String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: withComment)
    }
}


