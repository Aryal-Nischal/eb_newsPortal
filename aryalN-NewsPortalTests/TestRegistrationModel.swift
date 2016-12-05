//
//  TestRegistrationModel.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 12/2/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import XCTest
@testable import aryalN_NewsPortal

class TestRegistrationModel: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitialization(){
        let registerModelObject = RegisterModel(username: "JonDoe", password: "Doe", confirmPassword: "jond", email: "jondoe@yahoo.com")
        
        XCTAssert(registerModelObject.username == "JonDoe", "Error name shoud be johndoe")
        XCTAssert(registerModelObject.email == "jondoe@yahoo.com", "Error name shoud be johndoe")
        XCTAssert(registerModelObject.password == "Doe", "Error name shoud be johndoe")
        XCTAssert(registerModelObject.confirmPassword == "jond", "Error name shoud be johndoe")
    }
    
 
}
