//
//  Login_View.swift
//  Clonet
//
//  Created by Jimin on 2022/02/06.
//

import SwiftUI

struct Login_View: View {
    @ObservedObject var viewModel = Login_ViewModel()
    @ObservedObject var userAuth_VM : UserAuth = UserAuth()
    
    @State var isOn = true
    @State var isLogin: Bool = false
    @State var showingAlert: Bool = false
    @State var selection: Int? = nil
    @State private var selectionString: String? = nil
    
    @State var result = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("CLONET")
                    .font(.title)
                Spacer()

                
                // input
                VStack(alignment: .center) {
                    VStack(alignment: .center){
                        HStack(alignment: .center) { // id input
                            Image(systemName: "envelope").padding()
                            TextField("ID", text: $userAuth_VM.user_id)
                                .frame(width: 200)
                                .padding()
                        }
                        HStack(alignment: .center) { // passwd input
                            Image(systemName: "lock").padding()
                            //TextField("PASSWORD", text: $passwd)
                            SecureField("PASSWORD", text: $userAuth_VM.user_pw)
                                .frame(width: 200)
                                .padding()
                        }
                    }.padding([.leading, .bottom, .trailing])
                    
                    
                    Toggle(isOn: $isOn) { // AUTO LOGIN TOGGLE
                        Text("AUTO")
                    }
                    .frame(width: 130, height: 40)
                    .padding()
                    
                    ZStack {
                        ForEach(viewModel.login_msg, id: \.self) { msg in
                            if(msg == "TRUE"){
                                NavigationLink(destination: LoginCheck(userID: userAuth_VM.user_id), tag: "signupButton", selection: $selectionString) { }
                                .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                                Button("Login") {
                                    self.selectionString = "signupButton"
                                }
                            } else{
                                NavigationLink(destination: Login_View(), tag: "signupButton", selection: $selectionString) { }
                                .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                                Button("Login") {
                                    self.selectionString = "signupButton"
                                }.alert(isPresented: $showingAlert) {
                                    Alert(title: Text("로그인에 실패했습니다"), message: nil,
                                          dismissButton: .default(Text("확인")))
                                }
                            }
                        }
                        Button("Login") {
                            self.selectionString = "signupButton"
                            viewModel.login(id: userAuth_VM.user_id, passwd: userAuth_VM.user_pw)
                        }
                    }
                }
                
                // ID PASSWORD FIND
                Spacer()
                HStack (spacing:20) {
                    // Sign up
                    NavigationLink(destination: Signup(),
                                   label: {Text("SIGN UP")})
                    // Find ID && PASSWORD
                    NavigationLink(destination: FindIdPw(),
                                   label: {Text("ID / PASSWORD 찾기")})
                }.padding()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct Login_View_Previews: PreviewProvider {
    static var previews: some View {
        Login_View()
    }
}
