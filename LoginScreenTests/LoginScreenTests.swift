//
//  LoginScreenTests.swift
//  LoginScreenTests
//
//  Created by Viktor Kushnerov on 7/12/19.
//  Copyright © 2019 Viktor Kushnerov. All rights reserved.
//

import XCTest
import SwiftUI
@testable import LoginScreen

class LoginScreenTests: XCTestCase {
    @ObjectBinding var user = UserModelView()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testValidPassword() {
        user.password = "111"
        user.passwordRepeat = "111"
        
        sleep(1)
        user.$isValid
        .debounce(for: 1, scheduler: RunLoop.main)
        .sink { val in
            print(val)
            if self.user.password == "111" { XCTAssert(val) }
        }
        
//        sleep(2)
//        print(user.isValid)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
