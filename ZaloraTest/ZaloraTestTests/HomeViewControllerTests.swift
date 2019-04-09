//
//  HomeViewControllerTests.swift
//  ZaloraTestTests
//
//  Created by Kajal on 9/4/19.
//  Copyright © 2019 Kajal. All rights reserved.
//

import XCTest
@testable import ZaloraTest

class HomeViewControllerTests: XCTestCase {
    var instance = HomeViewController()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        instance = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        //load view hierarchy
        _ = instance.view
    }
    
    func testCanInstantiateViewController() {
        
        XCTAssertNotNil(instance)
        XCTAssertNotNil(instance.viewDidLoad())
    }
    
    func testTableVirereload(){
        XCTAssertNotNil(instance.homeTableView.reloadData())
    }
    
    func testTableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(instance.homeTableView)
    }
    
    func testShouldSetCollectionViewDataSource() {
        
        XCTAssertNotNil(instance.homeTableView.dataSource)
    }
    
    func testConformsToCollectionViewDataSource() {
        
        XCTAssert(instance.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(instance.responds(to: #selector(instance.homeTableView.dataSource?.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(instance.responds(to: #selector(instance.homeTableView.dataSource?.tableView(_:cellForRowAt:))))
        
    }
    
    func testCheckUpdateList(){
        let array = ["kajal"]
        XCTAssertNotNil(instance.didUpdateListManager(value: array))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
