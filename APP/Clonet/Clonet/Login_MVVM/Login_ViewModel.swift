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

final class Login_ViewModel: ObservableObject {
    @Published var logins: Logins = Logins.init()

//    @ObservedObject var userAuth : UserAuth = UserAuth()
    @Published var selectionString: String?

    @State private var showLinkTarget = false
    @Published var login_msg = [String]()
    @Published var result: Bool = false

    @Published var isOn = true
    @Published var isLogin: Bool = false
    @Published var showingAlert: Bool = false
    @Published var selection: Int?

    @Published var paswd: String = ""

    @Published var userID: String = ""
    @Published var userPW: String = ""

    init() {
        isLogin = false
        showingAlert = false
        autoLogin()
    }

    func login(id: String, passwd: String) {
        Network.shared.apollo.fetch(query: LoginQuery(userId: id)) { result in // Change the query name to your query name
            switch result {
            case .success(let graphQLResult):
                if let logins = graphQLResult.data?.login {
                    print("Success! Result: \(logins.indices) \(logins.count)")
                    print("\(graphQLResult)")

                    for i in logins.indices {
                        self.logins = self.process(data: logins[i] ?? LoginData.init(userId: "", userPw: "", userName: "", userEmail: "", profilePic: "", about: "", contact: ""))
                    }
                    // 로그인성공
                    if passwd == self.logins.user_pw && self.logins.user_pw != "" {
                        self.isLogin = true
                        self.showingAlert = false
                        if self.isOn == true {
//                            print("Auto Login")  // 자동 로그인 선택 시 로그인 하면서 uid, pwd 저장
                            UserDefaults.standard.set(id, forKey: "id")
                            UserDefaults.standard.set(passwd, forKey: "pwd")
                            UserDefaults.standard.synchronize()
                        }

                    } else {
                        self.isLogin = false
                        self.showingAlert = true
                    }
                } else if let errors = graphQLResult.errors {
                    print("GraphQL errors \(errors)")
                }

            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }

    func process(data: LoginData) -> Logins {
        return Logins(data)
    }

    // MARK: 자동 로그인
    func autoLogin() {
        let userid = UserDefaults.standard.string(forKey: "id")
        let pw = UserDefaults.standard.string(forKey: "pwd")
        if userid != nil && pw != nil {
            loginAutoNetwork(id: "\(userid!)", passwd: "\(pw!)")
        } else {
            self.selectionString = nil
        }
    }

    func loginAutoNetwork(id: String, passwd: String) {

        Network.shared.apollo.fetch(query: LoginQuery(userId: id)) { [self] result in // Change the query name to your query name
            switch result {
            case .success(let graphQLResult):
                if let logins = graphQLResult.data?.login {
                    print("Success! Result: \(logins.indices) \(logins.count)")
                    print("\(graphQLResult)")

                    for i in logins.indices {
                        self.logins = self.process(data: logins[i] ?? LoginData.init(userId: "", userPw: "", userName: "", userEmail: "", profilePic: "", about: "", contact: ""))
                    }
                    // 로그인성공
                    if passwd == self.logins.user_pw && self.logins.user_pw != "" {
                        self.selectionString = "true"
                        self.isLogin = true
                        userID = id
                    } else {
//                        self.isLogin = false
                        self.selectionString = nil
                    }
                } else if let errors = graphQLResult.errors {
                    print("GraphQL errors \(errors)")
                    self.selectionString = nil
                }

            case .failure(let error):
                print("Failure! Error: \(error)")
                self.selectionString = nil
            }
        }
    }
}
