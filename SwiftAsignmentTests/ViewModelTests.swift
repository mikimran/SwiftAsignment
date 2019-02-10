//
//  ViewModelTests.swift
//  SwiftAsignmentTests
//
//  Created by MOHAMMED IMRAN on 2/10/19.
//  Copyright © 2019 MOHAMMED IMRAN. All rights reserved.
//

import XCTest

@testable import SwiftAsignment


class ViewModelTests: XCTestCase {
        
    var viewModel: ViewModel?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
       self.viewModel = ViewModel()
        
    }
    func testSearchFilterWithEmptyKeyword() {
        //Given an array and empty search string, the returned array should be same number of items.
        
        let array = viewModel?.filterBySearchKeywords(searchKeyword: "", resultsArray: [])
        
        XCTAssertEqual(array?.count, 0)
        
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
}
