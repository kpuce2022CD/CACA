//
//  Login_ViewModel.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import Foundation
import SwiftUI
import Network

final class Login_ViewModel : ObservableObject {
    @ObservedObject var userAuth : UserAuth = UserAuth()
    @ObservedObject var login_Model = Login_Model()
    
    @Published var login_msg = [String]()
    @Published var result: Bool = false
    
    @Published var isOn = true
    @Published var isLogin: Bool = false
    @Published var showingAlert: Bool = false
    @Published var selection: Int? = nil
    
    private static let defaultID = "user1"
    private static let defaultpw = "passwd1"
    
    init(){
        login(id: Self.defaultID, passwd: Self.defaultpw)
    }
    
    func login(id: String, passwd: String){
        if(id == "aa" && passwd == "11"){
            result = true
        }else {
            result = false
        }
//        userAuth.user_id = id
//        userAuth.user_pw = passwd
//
//        // 로그인 정보를 보내는 변수
//        let loginJSON = "{\"user_id\": \"\(userAuth.user_id)\", \"user_pw\": \"\(userAuth.user_pw)\"}"
//
//        login_Model.login_button(json: loginJSON)
//
//        if(login_Model.messages != []){
//            self.login_msg = login_Model.messages
//            print("login1 msg: \(login_msg)")
//        }
    }
}

final class UserAuth : ObservableObject {
    @Published var user_id = ""
    @Published var user_pw = ""
}
