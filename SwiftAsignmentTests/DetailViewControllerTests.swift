//
//  DetailViewControllerTests.swift
//  SwiftAsignmentTests
//
//  Created by MOHAMMED IMRAN on 2/9/19.
//  Copyright © 2019 MOHAMMED IMRAN. All rights reserved.
//

import XCTest

@testable import SwiftAsignment

class DetailViewControllerTests: XCTestCase {
    
    var detailVC: DetailViewController!
    var detailItem = News()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        detailVC = storyboard.instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as? DetailViewController
        
        //load view hierarchy
        _ = detailVC.view
        
        
        XCTAssertNotNil(detailVC.viewDidLoad(), "viewDidLoad method called")
        
        XCTAssertNotNil(detailVC.didReceiveMemoryWarning(), "didReceiveMemoryWarning method called")
        
        XCTAssertNotNil(detailVC.configureView(), "configureView method called")
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
