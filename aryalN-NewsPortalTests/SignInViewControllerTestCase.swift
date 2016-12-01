//
//  SignInViewControllerTestCase.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/30/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import XCTest
@testable import aryalN_NewsPortal

class SignInViewControllerTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testcheckingPasswordValidity(){
        let validatingObject = ValidateUser(username: "a",password: "g1234e")
        let passwordValidity = validatingObject.isPasswordValid()
        XCTAssert(passwordValidity, "Password less than 6 characters")
    }
    
    func testcheckingUsernameValidity(){
        let validatingObject = ValidateUser(username: "nischal@google.com",password: "g1234e")
        let usernameValidity = validatingObject.isUsernameValid()
        XCTAssert(usernameValidity, "Username is not email")
    }
    
}
