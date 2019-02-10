//
//  NewsTableViewCellTests.swift
//  SwiftAsignmentTests
//
//  Created by MOHAMMED IMRAN on 2/9/19.
//  Copyright © 2019 MOHAMMED IMRAN. All rights reserved.
//

import XCTest

@testable import SwiftAsignment

class NewsTableViewCellTests: XCTestCase {
    
    var NewsTableView = UITableView()
    var newCell = NewsTableViewCell()
    override func setUp() {
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        NewsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
        newCell.awakeFromNib()
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    
    }
}
