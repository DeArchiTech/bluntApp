//
//  APIManagerTest.swift
//  bluntApp
//
//  Created by davix on 8/20/16.
//  Copyright © 2016 geniemedialabs. All rights reserved.
//

import XCTest
@testable import bluntApp

class APIManagerTest: XCTestCase {
    
    var apiManager : APIManager?
    var expectation : XCTestExpectation?
    var testingForPass : Bool = true
    var defaultDelegate : testDelegateOnComplete?
    
    class testDelegateOnComplete : APIOnCompleteCallBack{
        
        var amt : APIManagerTest
        
        init(amt : APIManagerTest){
            
            self.amt = amt
            
        }
        
        func onNetworkSuccess(nsobject : NSObject){
            
            //Test Delegate Fired successfully
            XCTAssertNotNil(nsobject)
            let testingForPass = self.amt.testingForPass
            XCTAssertTrue(testingForPass)
            self.amt.expectation?.fulfill()
            
        }
        
        func onNetworkFailure(statusCode : Int , message : String) {
            
            //Test Delegate Fired successfully
            XCTAssertTrue(statusCode != 200)
            let testingForPass = self.amt.testingForPass
            XCTAssertFalse(testingForPass)
            self.amt.expectation?.fulfill()
            
        }
        
    }
    
    override func setUp() {
        super.setUp()
        self.defaultDelegate = testDelegateOnComplete(amt :self)
        self.apiManager = APIManager(delegate: self.defaultDelegate!)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFacebookLogin() {
        
        //**Success Case set up
        
        self.testingForPass = true
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Login Network Call")
        XCTAssertTrue(self.apiManager!.login())
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
        //**Failure Case set up
        
        //self.testingForPass = false
        
        //Test Function Fired successfully
        //self.expectation = self.expectationWithDescription("Login Network Call")
        //XCTAssertTrue(self.apiManager!.login())
        
        //If test delegate is fired successfully , it will remove this timer
        //self.waitForExpectationsWithTimeout(15.0, handler:nil)

    }
    
    func testGetFilteredUsers() {
        
        //**Success Case set up
        
        self.testingForPass = true
        
        //Test Function Fired successfully
        self.expectation = self.expectationWithDescription("Get User Network Call")
        XCTAssertTrue(self.apiManager!.getUsers("1"))
        
        //If test delegate is fired successfully , it will remove this timer
        self.waitForExpectationsWithTimeout(15.0, handler:nil)
        
    }
    
}
