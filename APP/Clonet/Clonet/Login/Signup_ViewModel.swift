//
//  Signup_ViewModel.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/06/02.
//

import Foundation
import SwiftUI
import Network
import Apollo

final class Signup_ViewModel : ObservableObject {
    
    @State var userId = ""
    
    
    func signup(id: String, passwd: String, name: String, userEmail: String){
        Network.shared.apollo.perform(mutation: SignupMutation(user_id: id, user_pw: passwd, user_name: name, user_email: userEmail)) { result in // Change the query name to your query name
            switch result {
            case .success(let graphQLResult):
                print(graphQLResult.data?.signup)
                self.userId = "success"

            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}
