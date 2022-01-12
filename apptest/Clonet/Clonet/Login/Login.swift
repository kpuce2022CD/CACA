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
                            TextField("PASSWORD", text: $passwd)
                                .frame(width: 200)
                                .padding()
                        }
                    }.padding([.leading, .bottom, .trailing])
                    
                    
                    Toggle(isOn: $isOn) { // AUTO LOGIN TOGGLE
                        Text("AUTO")
                    }
                    .frame(width: 130, height: 40)
                    .padding()
                    
                    if(login()){
                        NavigationLink( destination: LoginCheck(id: id), label: { Text("LOGIN SUCCESS!")
                            .foregroundColor(Color.black) })
                            .frame(width: 200, height: 40)
                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                    }else{
                        Text("LOGIN PLEASE")
                            .foregroundColor(Color.black) //.hidden()
                            .frame(width: 200, height: 40)
                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
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
        .navigationBarBackButtonHidden(true)
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
