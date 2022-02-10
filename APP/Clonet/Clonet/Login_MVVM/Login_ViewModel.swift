//
//  Login_ViewModel.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import Foundation
import SwiftUI
import Network
import Apollo

final class Login_ViewModel : ObservableObject {
    @Published var logins: Logins = Logins.init()
    
//    @ObservedObject var userAuth : UserAuth = UserAuth()
    @ObservedObject var login_Model = Login_Model()
    
    @Published var login_msg = [String]()
    @Published var result: Bool = false
    
    @Published var isOn = true
    @Published var isLogin: Bool = false
    @Published var showingAlert: Bool = false
    @Published var selection: Int? = nil
    
    init(){
        isLogin = false
        login(id: "", passwd: "")
    }
    
    func login(id: String, passwd: String) {
        
        Network.shared.apollo.fetch(query: LoginQuery(userId: id)) { result in // Change the query name to your query name
            switch result {
            case .success(let graphQLResult):
                if let logins = graphQLResult.data?.login{
                    print("Success! Result: \(logins.indices) \(logins.count)")
//                    print("\(graphQLResult)")
//                    DispatchQueue.main.sync {
//                    self.user = logins
////                    }
//
//                    print("\(logins)")
                    for i in logins.indices{
                        self.logins = self.process(data: logins[i] ?? LoginData.init(userId: "", userPw: "", userName: "", userEmail: "", profilePic: "", about: "", contact: ""))
                    }
                    
                    if(passwd == self.logins.user_pw && self.logins.user_pw != ""){
                        self.isLogin = true
                        
                    } else {
                        self.isLogin = false
                    }
                } else if let errors = graphQLResult.errors {
//                    print("GraphQL errors \(errors)")
                }
                
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    func process(data: LoginData) -> Logins {
        return Logins(data)
    }
}

//final class UserAuth : ObservableObject {
//    @Published var user_id = ""
//    @Published var user_pw = ""
//}
