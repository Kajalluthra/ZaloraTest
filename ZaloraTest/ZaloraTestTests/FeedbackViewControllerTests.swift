//
//  FeedbackViewControllerTests.swift
//  ZaloraTestTests
//
//  Created by Kajal on 9/4/19.
//  Copyright © 2019 Kajal. All rights reserved.
//

import XCTest
@testable import ZaloraTest

class FeedbackViewControllerTests: XCTestCase {
    var instance = FeedbackViewController()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        instance = storyboard.instantiateViewController(withIdentifier: "FeedbackViewController") as! FeedbackViewController
        //load view hierarchy
        _ = instance.view
    }
    
    func testCanInstantiateViewController() {
        
        XCTAssertNotNil(instance)
        XCTAssertNotNil(instance.viewDidLoad())
        XCTAssertNotNil(instance.validate(""))
    }
    
    func testTweetMessageLengthLessThanMaximum() {
        
        let input = "Hello, Swift"
        let expected = ["Hello, Swift"]
        
        let output = instance.splitFeedback(input, length: 50)
        
        XCTAssertEqual(output.count, 1, "Should only 1 components")
        XCTAssertEqual(output, expected, "Short Message should be same the original")
    }
    
    func testTheExampleInAssigment() {
        
        let input = "I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself."
        let expected = ["1/2 I can't believe Tweeter now supports chunking my",
                        "2/2 messages, so I don't have to do it myself."]
        
        let output = instance.splitFeedback(input, length: 50)

        XCTAssertEqual(output.count, 2, "Should only 2 components")
        XCTAssertEqual(output, expected, "Same the expectation from the Assignment")
    }
    
    func testCreateTweetComponentWithNewOneCase() {
        
        let input = "Twitter mostly uses Ruby on Rails for their front-end and primarily Scala and Java for back-end services. They use Apache Thrift (originally developed by Facebook) to communicate between different internal services."
        let expected = ["1/5 Twitter mostly uses Ruby on Rails for their",
                        "2/5 front-end and primarily Scala and Java for",
                        "3/5 back-end services. They use Apache Thrift",
                        "4/5 (originally developed by Facebook) to communicate",
                        "5/5 between different internal services."]
        
        let output = instance.splitFeedback(input, length: 50)
        XCTAssertEqual(output, expected, "Same the expectation from the Assignment")
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
