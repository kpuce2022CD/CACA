//
//  Login_ViewModel.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import Foundation
import SwiftUI

final class Login_ViewModel : ObservableObject {
    @ObservedObject var userAuth : UserAuth = UserAuth()
    @ObservedObject var login_Model = Login_Model()
    
    @Published var login_msg = [String]()
    
    private static let defaultID = "user1"
    private static let defaultpw = "passwd1"
    
//    init(){
//        login(id: Self.defaultID, passwd: Self.defaultpw)
//    }
    
    func login(id: String, passwd: String){
        userAuth.user_id = id
        userAuth.user_pw = passwd
        
        // 로그인 정보를 보내는 변수
        let loginJSON = "{\"user_id\": \"\(userAuth.user_id)\", \"user_pw\": \"\(userAuth.user_pw)\"}"
        
        login_Model.login_button(json: loginJSON)
        
        if(login_Model.messages != []){
            self.login_msg = login_Model.messages
            print("login1 msg: \(login_msg)")
        }else {
            print("login1 sleep")
        }
    }
    
//    func login_result(msg: [String]){
//        self.login_msg = msg
//    }
}

final class UserAuth: ObservableObject {
    @Published var user_id = ""
    @Published var user_pw = ""
}
