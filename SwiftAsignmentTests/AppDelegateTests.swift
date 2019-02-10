//
//  AppDelegateTests.swift
//  SwiftAsignmentTests
//
//  Created by MOHAMMED IMRAN on 2/9/19.
//  Copyright © 2019 MOHAMMED IMRAN. All rights reserved.
//

import XCTest

@testable import SwiftAsignment

class AppDelegateTests: XCTestCase {
    
    
    var appDelegate =  AppDelegate()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testApplicationWillResignActive() {
        XCTAssertNotNil(appDelegate.applicationWillResignActive(UIApplication.shared), "ApplicationWillResignActive method called")
    }
    
    func testApplicationDidEnterBackground() {
        XCTAssertNotNil(appDelegate.applicationDidEnterBackground(UIApplication.shared), "ApplicationDidEnterBackground method called")
    }
    func testApplicationWillEnterForegrounde() {
        XCTAssertNotNil(appDelegate.applicationWillEnterForeground(UIApplication.shared), "ApplicationWillEnterForeground method called")
    }
    func testApplicationDidBecomeActive() {
        XCTAssertNotNil(appDelegate.applicationDidBecomeActive(UIApplication.shared), "ApplicationDidBecomeActive method called")
    }
    
    func testapplicationWillTerminate() {
        XCTAssertNotNil(appDelegate.applicationWillTerminate(UIApplication.shared), "ApplicationWillTerminate method called")
    }

    
}
