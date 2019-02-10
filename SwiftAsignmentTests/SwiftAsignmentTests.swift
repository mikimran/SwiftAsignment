//
//  SwiftAsignmentTests.swift
//  SwiftAsignmentTests
//
//  Created by MOHAMMED IMRAN on 2/9/19.
//  Copyright © 2019 MOHAMMED IMRAN. All rights reserved.
//

import XCTest
@testable import SwiftAsignment

class SwiftAsignmentTests: XCTestCase {
    
    var storyboard : UIStoryboard?
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.storyboard = UIStoryboard(name: "Main",
                                       bundle: Bundle.main)
        
        XCTAssertNotNil(self.storyboard)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDetailView() {
        
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")
        XCTAssertNotNil(detailViewController)
        XCTAssertTrue(detailViewController is DetailViewController)
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
