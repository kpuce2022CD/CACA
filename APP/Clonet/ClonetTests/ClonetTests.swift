//
//  ClonetTests.swift
//  ClonetTests
//
//  Created by Jimin on 2022/02/14.
//

import XCTest
@testable import Clonet

class LoginProvider{
    func asyncTask(completionHandler: @escaping (String?) -> Void){
        
    }
}

class ClonetTests: XCTestCase {
    var loginViewModel: Login_ViewModel!
    
    var userID: String = "user1"
    var userPW: String = "pasffswd"
    
    override func setUp() {
        loginViewModel = .init()
    }
    
    func testLoginResultTrue(){
        //        var isSuccess = false
        //        let viewModel = Login_ViewModel()
        //        let Exp = XCTestExpectation(description: "login Test ing...")
        //        viewModel.login(id: userID, passwd: userPW){ (res) in
        //            isSuccess = res
        //            Exp.fulfill()
        //        }
        //        wait(for: [Exp], timeout: 2)
        //        XCTAssertTrue(isSuccess)
        
    }
    
    func testLoginResult(){
        //        let testExpectation = expectation(description: "Expected login completion handler to be called")
        
        loginViewModel.login(id: userID, passwd: userPW)
        
        
        if(userPW == loginViewModel.paswd && loginViewModel.logins.user_pw != ""){
            XCTAssertTrue(loginViewModel.isLogin, "login Success")
        }else{
            
            XCTAssertFalse(loginViewModel.isLogin, "login Failed")
        }
    }
    
    
    //    // 메소드 실행 전 모든 상태 reset
    //    override func setUpWithError() throws {
    //        // Put setup code here. This method is called before the invocation of each test method in the class.
    //    }
    //
    //    // 테스트 끝난 후 모든 상태 clean
    //    override func tearDownWithError() throws {
    //        // Put teardown code here. This method is called after the invocation of each test method in the class.
    //    }
    //
    //    func testExample() throws {
    //        // This is an example of a functional test case.
    //        // Use XCTAssert and related functions to verify your tests produce the correct results.
    //        // Any test you write for XCTest can be annotated as throws and async.
    //        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
    //        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    //    }
    //
    //    func testPerformanceExample() throws {
    //        // This is an example of a performance test case.
    //        measure {
    //            // Put the code you want to measure the time of here.
    //        }
    //    }
    
}
