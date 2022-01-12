//
//  Login.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/10.
//

import SwiftUI
import SocketIO

//로그인 정보 보내기
final class Service_login: ObservableObject {
    private var manager = SocketManager(socketURL: URL(string: "ws://localhost:3000")!, config: [.log(true), .compress])

    @Published var messages = [String]()
    @Published var loginJSON = ""
    @State var json: String = ""
    
    init(json: String){
        let socket = manager.defaultSocket
        socket.on(clientEvent: .connect){ (data, ack) in
            print("Connected")
            socket.emit("login", json)
            socket.emit("login", self.loginJSON)
            
            socket.disconnect()
        }
        
        socket.on("login"){ [weak self] (data, ack) in
            print(data);
        }

//        socket.on(clientEvent: .connect){ (data, ack) in
//            print("Connected")
//            socket.emit("login", self.loginJSON)
//        }
        socket.connect()
    }



}

struct Login: View {
    @State var id : String = ""
    @State var passwd : String = ""
    @State var isOn = true
    @State var isLogin: Bool = false
    @State var showingAlert: Bool = false
    @State var selection: Int? = nil
    
    
    var body: some View {
        NavigationView{
            // 로그인 정보를 보내는 변수
            var loginJSON = "{\"user_id\": \"\(self.id)\", \"user_pw\": \"\(self.passwd)\"}"
            VStack {
                // title
                Button(action: {
                    Service_login(json: loginJSON)
                }, label: {Text("Login to DB")})
                Spacer()
                Text("CLONET")
                    .font(.title)
                Spacer()
                
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
                    
                    NavigationLink(destination: LoginCheck(id: id), isActive: $isLogin){
                        Button(action: {
                            login(id: id, passwd: passwd)
                        }){
                            Text("LOGIN")
                                .font(.headline)
                                .padding()
                                .cornerRadius(10.0)
                            .foregroundColor(Color.black)
                            .frame(width: 200, height: 40)
                        }.ignoresSafeArea()
                                if(id == "" || passwd == ""){
                                    Text("")
                                        .alert(isPresented: $showingAlert){
                                            Alert(title: Text(""), message: Text("아이디와 비밀번호를 입력하세요."), dismissButton: .default(Text("닫기")))
                                        }
                                }else{
                                    Text("")
                                        .alert(isPresented: $showingAlert){
                                            Alert(title: Text("불일치"), message: Text("아이디 또는 비밀번호가 잘못되었습니다."), dismissButton: .default(Text("닫기")))
                                }
                            }
                    }
                    
//                    if(login()){
//                        NavigationLink( destination: LoginCheck(id: id), label: { Text("LOGIN SUCCESS!")
//                            .foregroundColor(Color.black) })
//                            .frame(width: 200, height: 40)
//                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
//                    }else{
//                        Text("LOGIN PLEASE")
//                            .foregroundColor(Color.black) //.hidden()
//                            .frame(width: 200, height: 40)
//                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
//                    }
                    
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
        .navigationBarBackButtonHidden(true)
    }
    
    func login(id: String, passwd: String){
        if(id == "B" && passwd == "A"){
            self.passwd=""
            isLogin = true
        }else{
            showingAlert = true
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
