////
////  Login.swift
////  Clonet
////
////  Created by Hye Min Choi on 2022/01/10.
////
//
//import SwiftUI
//import SocketIO
//import Combine
//
////로그인 정보 보내기
//final class Service_login: ObservableObject {
//    private var manager = SocketManager(socketURL: URL(string: "ws://localhost:3000")!, config: [.log(true), .compress])
//
//    @Published var messages = [String]()
//    @Published var loginJSON = ""
//    @State var json: String = ""
//
//    func login_button(json: String){
//        let socket = manager.defaultSocket
//
//        socket.on(clientEvent: .connect){ (data, ack) in
//            print("Connected")
//            self.loginJSON = json
//            socket.emit("login", self.loginJSON)
//        }
//
//
//        socket.on("login_result"){ [weak self] (data, ack) in
//
//            if let data = data[0] as? [String: String],
//               let rawMessage = data["login_RESULT"] {
//                DispatchQueue.main.async {
//                    self?.messages.append(rawMessage)
//                    print("rawMessage: ", String(rawMessage))
//                    socket.disconnect()
//
//                }
//            }
//        }
//        socket.connect()
//    }
//}
//
//class UserAuth: ObservableObject {
//    @Published var user_id = ""
//    @Published var user_pw = ""
//}
//
//
//struct Login: View {
//    @ObservedObject var service = Service_login()
//    @ObservedObject var userAuth : UserAuth = UserAuth()
//
//    @State var isOn = true
//    @State var isLogin: Bool = false
//    @State var showingAlert: Bool = false
//    @State var selection: Int? = nil
//    @State private var selectionString: String? = nil
//
//    @State var result = ""
//
//
//    var body: some View {
//        NavigationView {
//            // 로그인 정보를 보내는 변수
//            let loginJSON = "{\"user_id\": \"\(userAuth.user_id)\", \"user_pw\": \"\(userAuth.user_pw)\"}"
//
//            VStack {
//                Spacer()
//                Text("CLONET")
//                    .font(.title)
//                Spacer()
//
//
//                // input
//                VStack(alignment: .center) {
//                    VStack(alignment: .center){
//                        HStack(alignment: .center) { // id input
//                            Image(systemName: "envelope").padding()
//                            TextField("ID", text: $userAuth.user_id)
//                                .frame(width: 200)
//                                .padding()
//                        }
//                        HStack(alignment: .center) { // passwd input
//                            Image(systemName: "lock").padding()
//                            //TextField("PASSWORD", text: $passwd)
//                            SecureField("PASSWORD", text: $userAuth.user_pw)
//                                .frame(width: 200)
//                                .padding()
//                        }
//                    }.padding([.leading, .bottom, .trailing])
//
//
//                    Toggle(isOn: $isOn) { // AUTO LOGIN TOGGLE
//                        Text("AUTO")
//                    }
//                    .frame(width: 130, height: 40)
//                    .padding()
//
//
//                    ZStack {
//                        ForEach(service.messages, id: \.self) { msg in
//                            if(msg == "TRUE"){
//                                NavigationLink(destination: LoginCheck(userID: userAuth.user_id), tag: "signupButton", selection: $selectionString) { }
//                                .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
//                                Button("Login UP") {
//                                    self.selectionString = "signupButton"
//                                }
//                            } else{
//                                NavigationLink(destination: Login(), tag: "signupButton", selection: $selectionString) { }
//                                .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
//                                Button("Login UP") {
//                                    self.selectionString = "signupButton"
//                                }.alert(isPresented: $showingAlert) {
//                                    Alert(title: Text("로그인에 실패했습니다"), message: nil,
//                                          dismissButton: .default(Text("확인")))
//                                }
//
//                            }
//                        }
//                        Button("Login UP") {
//                            self.selectionString = "signupButton"
//                            service.login_button(json: loginJSON)
//                        }
//                    }
//
//                }
//
//                // ID PASSWORD FIND
//                Spacer()
//                HStack (spacing:20) {
//                    // Sign up
//                    NavigationLink(destination: Signup(),
//                                   label: {Text("SIGN UP")})
//                    // Find ID && PASSWORD
//                    NavigationLink(destination: FindIdPw(),
//                                   label: {Text("ID / PASSWORD 찾기")})
//                }.padding()
//            }
//        }
//        .navigationViewStyle(StackNavigationViewStyle())
//        .navigationViewStyle(StackNavigationViewStyle())
//        .navigationBarBackButtonHidden(true)
//        .navigationBarTitle("")
//        .navigationBarHidden(true)
//    }
//
//
//}
//
//struct Login_Previews: PreviewProvider {
//    static var previews: some View {
//        ForEach(["iPhone 13", "iPhone XS Max", "iPad (9th generation)"], id: \.self) { deviceName in
//            Login()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
//    }
//}
