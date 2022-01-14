//
//  Login.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/10.
//

import SwiftUI
import SocketIO


var count = 0
//로그인 정보 보내기
final class Service_login: ObservableObject {
    private var manager = SocketManager(socketURL: URL(string: "ws://localhost:3000")!, config: [.log(true), .compress])

    @Published var messages = [String]()
    @Published var loginJSON = ""
    @State var json: String = ""
    
    func login_button(json: String){
        let socket = manager.defaultSocket
        
        socket.on(clientEvent: .connect){ (data, ack) in
            print("Connected")
            self.loginJSON = json
            socket.emit("login", self.loginJSON)
        }
        
        
        socket.on("login_result"){ [weak self] (data, ack) in
            
            if let data = data[0] as? [String: String],
               let rawMessage = data["login_RESULT"] {
                DispatchQueue.main.async {
                    self?.messages.append(rawMessage)
                    print("rawMessage: ", String(rawMessage))
                    socket.disconnect()
                    
                }
            }
            
            
        }

        socket.connect()
    }



}

struct Login: View {
    @ObservedObject var service = Service_login()
    
    @State var id : String = ""
    @State var passwd : String = ""
    @State var isOn = true
    @State var isLogin: Bool = false
    @State var showingAlert: Bool = false
    @State var selection: Int? = nil
    @State private var selectionString: String? = nil
    
    @State var result = ""
    
    var body: some View {
        NavigationView{
            // 로그인 정보를 보내는 변수
            let loginJSON = "{\"user_id\": \"\(self.id)\", \"user_pw\": \"\(self.passwd)\"}"
            VStack {
                // title
//                Button(action: {
//                    Service_login(json: loginJSON)
//                }, label: {Text("Login to DB")})
                Spacer()
                Text("CLONET")
                    .font(.title)
                Spacer()
                /////////////////////////////////////////////////////////////////////////// // 서버에서 받아온 login_result 출력
//                ForEach(service.messages, id: \.self) { msg in
//                    Text(msg).padding()
//                }
                /////////////////////////////////////////////////////////////////////////////
                
                // input
                VStack(alignment: .center) {
                    VStack(alignment: .center){
                        HStack(alignment: .center) { // id input
                            Image(systemName: "envelope").padding()
                            TextField("ID", text: $id)
                                .frame(width: 200)
                                .padding()
                        }
                        HStack(alignment: .center) { // passwd input
                            Image(systemName: "lock").padding()
                            //TextField("PASSWORD", text: $passwd)
                            SecureField("PASSWORD", text: $passwd)
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
                        ForEach(service.messages, id: \.self) { msg in
                            if(msg == "TRUE"){
                                NavigationLink(destination: EmptyView(), tag: "signupButton", selection: $selectionString) { }
                                .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                            }
                        }
                        Button("Login UP") {
                            self.selectionString = "signupButton"
                            service.login_button(json: loginJSON)
                            print("loginJSON: ", loginJSON)
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
//
    }
    
    func login() -> Bool {
        print("func login()")
        if(id == "B" && passwd == "A"){
            return true
        }else{
            return false
        }
    }

}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13", "iPhone XS Max", "iPad (9th generation)"], id: \.self) { deviceName in
            Login()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
