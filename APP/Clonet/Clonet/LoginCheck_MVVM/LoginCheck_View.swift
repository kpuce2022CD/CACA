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
    
    @State var userID : String
    
    var body: some View {
        NavigationView{
            HStack{
                VStack{
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.indigo, lineWidth: 3))
                        .offset(y: -130)
                        .padding(.bottom, -130)
                        .padding()
                    VStack(alignment: .center){
                        Text(userID)
                            .font(.title)
                    }
                    .padding()
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
                                }
                            }
                            .ignoresSafeArea(edges: .all)
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .ignoresSafeArea(.all)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .hiddenNavigationBarStyle()
                }
            }.refreshable {
                logincheck_ViewModel.fetch(user_id: userID)
            }
        }
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .hiddenNavigationBarStyle()
//        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            logincheck_ViewModel.fetch(user_id: userID)
        }
//        .refreshable {
//            await LoginCheck_View(userID: userID)
//        }
    }
}

//struct LoginCheck_View_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginCheck_View(userID: "")
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
