//
//  Login_View.swift
//  Clonet
//
//  Created by Jimin on 2022/02/06.
//

import SwiftUI

struct Login_View: View {
    @StateObject private var viewModel = Login_ViewModel()
    @ObservedObject var userAuth_VM : UserAuth = UserAuth()
    
    @State private var selectionString: String? = nil
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                //Spacer(minLength: 10.0)
                HStack(alignment: .center){
                    Image("clonet_logo_white")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .shadow(radius: 5)
                    
                    Text("CLONET")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                }
                Spacer(minLength: 25.0)
                
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
                    
                    
                    // Login Btn
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
                                }
                                .alert(isPresented: $viewModel.showingAlert) {
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
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 250, height: 10)
                    .padding()
                    //.background(LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
                    .background(
                        AngularGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                                        center: .topLeading,
                                        angle: .degrees(180 + 45))
                    )
                    .cornerRadius(15.0)
                }
                
                Toggle(isOn: $viewModel.isOn) { // AUTO LOGIN TOGGLE
                    Text("AUTO")
                }
                .frame(width: 140, height: 20)
                .padding()
                .tint(.blue)
                
                
                // ID PASSWORD FIND
                Spacer()
                HStack (spacing:20) {
                    // Sign up
                    NavigationLink(destination: Signup(),
                                   label: {Text("SIGN UP")})
                        .padding()
                    // Find ID && PASSWORD
                    NavigationLink(destination: FindIdPw(),
                                   label: {Text("ID / PASSWORD 찾기")})
                        //.padding()
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
