//
//  RegisterUnitTests.swift
//  UnitTests
//
//  Created by Anisha  KATUMBA  on 31/12/2018.
//  Copyright © 2018 Jessica Owusu. All rights reserved.
//

import XCTest
@testable import FProject

class RegisterCustomerUnitTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func shouldNotSuccessfullyConnectToDBToCreateAccount() {
        
    //    let register = RegisterCustomerViewController.RegisterUser()
        
   //     XCTAssert(true, "")
        
    }

    func testExample() {
        
        // connects to db successfully to register
        // correct info -> goes to confirmation page.
        // invalid username, no special characters, up to 8 char
        // enters taaken username, username taken
        // enters invalid email, email invalid
        // enters taken emsail, email taken
        // invalid passowrd, password constraints
        // password don't match
        
        

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
