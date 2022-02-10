//
//  LoginCheck_View.swift
//  Clonet
//
//  Created by Jimin on 2022/02/09.
//


import SwiftUI
import Foundation
import SwiftGit2

struct LoginCheck_View: View {
    @StateObject var logincheck_ViewModel = LoginCheck_ViewModel()
    @State private var showAlert = false
    
    var userID : String = ""
    
    init(userID: String){
        self.userID = userID
    }
    
    var body: some View {
        NavigationView{
            HStack{
                Text(userID)
                VStack{
                    Spacer()
                    logincheck_ViewModel.UserMainImage
                        .padding()
                    logincheck_ViewModel.UserInfo
                    Spacer()
                }
                VStack{
                    HStack{
                        Spacer()
                        Button(action: {
                            logincheck_ViewModel.loginCheck_alert(userID: userID)
                        }) {
                            Text("추가")
                        }
                        .padding()
                    }
                    
                    
                    List{
                        ForEach(logincheck_ViewModel.Repo_List, id: \.id) { s in
                            NavigationLink(destination: Repo_View(userID: userID, repoName: s.repo_name)){
                                VStack{
                                    Text("repo_name: \(s.repo_name)")
//                                    Text("userId: \(s.user_id)")
//                                    Text("--")
                                }
                            }
                        }
                        //                        ForEach(logincheck_ViewModel.Repo_List, id: \.self) { i in
                        //                            VStack{
                        //                                Text().padding()
                        //                                    .padding(2)
                        //                                    .font(.title3)
                        //                            }
                        //
                        ////                            NavigationLink(destination: Repo_Home(repoName: i, user_id: userID)){
                        ////                                VStack{
                        ////                                    Text(i).padding()
                        ////                                        .padding(2)
                        ////                                        .font(.title3)
                        ////                                }
                        ////                            }
                        //                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
        .onAppear {
            logincheck_ViewModel.fetch(user_id: userID)
        }
        .navigationBarBackButtonHidden(true)
        .hiddenNavigationBarStyle()
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LoginCheck_View_Previews: PreviewProvider {
    static var previews: some View {
        LoginCheck_View(userID: "")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
