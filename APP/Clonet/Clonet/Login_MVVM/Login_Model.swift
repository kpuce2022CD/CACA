//
//  Login_Model.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import Foundation
import SocketIO
import Combine

//로그인 정보 보내기
 
typealias LoginData = LoginQuery.Data.Login



//public struct loginStruct {
//
//    init(){
//
//    }
//    struct Logins: Decodable {
//        var user_id : String
//        var user_pw : String
//        var user_name : String
//        var user_email : String
//        var profilePic : String
//        var about : String
//        var contact : String
//
//        init(){
//            self.user_id = ""
//            self.user_pw = ""
//            self.user_name = ""
//            self.user_email = ""
//            self.profilePic = ""
//            self.about = ""
//            self.contact = ""
//        }
//
//        init(_ users: LoginData?){
//            self.user_id = users?.userId ?? ""
//            self.user_pw = users?.userPw ?? ""
//            self.user_name = users?.userName ?? ""
//            self.user_email = users?.userEmail ?? ""
//            self.profilePic = users?.profilePic ?? ""
//            self.about = users?.about ?? ""
//            self.contact = users?.contact ?? ""
//
//        }
//
//    }
//
//}

struct Logins: Decodable {
    var user_id : String
    var user_pw : String
    var user_name : String
    var user_email : String
    var profilePic : String
    var about : String
    var contact : String
    
    init(){
        self.user_id = ""
        self.user_pw = ""
        self.user_name = ""
        self.user_email = ""
        self.profilePic = ""
        self.about = ""
        self.contact = ""
    }
    
    init(_ users: LoginData?){
        self.user_id = users?.userId ?? ""
        self.user_pw = users?.userPw ?? ""
        self.user_name = users?.userName ?? ""
        self.user_email = users?.userEmail ?? ""
        self.profilePic = users?.profilePic ?? ""
        self.about = users?.about ?? ""
        self.contact = users?.contact ?? ""

    }

}
