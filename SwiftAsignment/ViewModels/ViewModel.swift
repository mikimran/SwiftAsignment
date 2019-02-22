//
//  ViewModel.swift
//  SwiftAssessment
//
//  Created by MOHAMMED IMRAN on 2/7/19.
//  Copyright © 2019 MOHAMMED IMRAN. All rights reserved.
//

import UIKit
import Foundation

/**
 The purpose of the `ViewModelDelegate` is to pass the data via delegate.
 - didReceiveNews acts as delegate on success response
 - didFailed acts as the delegate error response.
 */
protocol ViewModelDelegate: class {
    func didReceiveNews()
    func didFailed()
}


class ViewModel: NSObject {
    
    weak var viewModelDelegate:ViewModelDelegate?
    var Newsdata = NewsData(){
        didSet{
            viewModelDelegate?.didReceiveNews()
        }
    }
    
    ///  Initialization for the view model to be setup
    override init() {
        super.init()

        ///Get the NewsData from the service api.
        ServiceManager.sharedInstance.getData({ [unowned self] (response : NewsData)  in
            self.Newsdata = response
        }) { (error) in
            self.viewModelDelegate?.didFailed()
        }
    }
    
    /**
     Searches for and presence of a given string in the title of the given array.
     
     - parameter searchKeyword: String to search, must contain a value.
     - parameter resultsArray: Array to search, must hold MainArray types.
     - returns: Filtered array
     */
    func filterBySearchKeywords(searchKeyword: String, resultsArray : Array<News>) -> Array<News> {
        
        guard !searchKeyword.isEmpty else {
            return resultsArray
        }
        
        let filteredArray = resultsArray.filter({
            (result : News) -> Bool in
            return (result.title?.localizedCaseInsensitiveContains(searchKeyword))!
        })
        
        return filteredArray
    }
    
    
}
