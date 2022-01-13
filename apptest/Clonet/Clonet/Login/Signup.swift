//
//  Signup.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/11.
//
import SwiftUI
import SocketIO

//로그인 정보 보내기
final class Service_signup: ObservableObject {
    private var manager = SocketManager(socketURL: URL(string: "ws://localhost:3000")!, config: [.log(true), .compress])

    @Published var messages = [String]()
    @Published var loginJSON = ""
    @State var json: String = ""
    
    init(json: String){
        let socket = manager.defaultSocket
        socket.connect()
        
        
        socket.on(clientEvent: .connect){ (data, ack) in
            print("Connected")
//            socket.emit("signup", json)
            self.loginJSON = json
            socket.emit("signup", self.loginJSON)
            
            socket.disconnect()
        }
        
//        socket.on("signup"){ [weak self] (data, ack) in
//            print(data);
//        }

//        socket.on(clientEvent: .connect){ (data, ack) in
//            print("Connected")
//            socket.emit("login", self.loginJSON)
//        }
    
    }



}


struct Signup: View {
    @State var id = ""
    @State var password = ""
    @State var passwordCheck = ""
    @State var email = ""
    @State var name = ""
    @State var showingAlert = true // SignUP ERROR
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center)  {
                
                var signupJSON = "{\"user_id\": \"\(self.id)\", \"user_pw\":\"\(self.password)\", \"user_name\":\"\(self.name)\", \"user_email\":\"\(self.email)\"}"
                
                Button(action: {Service_signup(json: signupJSON)}, label: {Text("SIGN UP")})
                Text("SIGN UP")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Form{
                    Section(header: Text("INPUT YOUR ID")) {
                        TextField("ID", text: $id)
                            .padding()
                    }
                    Section(header: Text("INPUT YOUR PASSWORD")) {
                        TextField("PASSWORD", text: $password)
                            .padding()
                        TextField("PASSWORD CHECK", text: $passwordCheck)
                            .padding()
                    }
                    Section(header: Text("INPUT YOUR EMAIL")) {
                        TextField("EMAIL", text: $email)
                            .padding()
                    }
                    Section(header: Text("INPUT YOUR NAME")) {
                        TextField("NAME", text: $name)
                            .padding()
                    }
                    Section{
                        if(signin() && !signinCheck()){
                            NavigationLink(destination: Login(), tag: 1, selection: $selection){
                                Button(action: {
                                    self.selection = 1
                                }) {
                                    Text("Sign up")
                                }
                            }
                        }else if(signin() && signinCheck()){
                            Text("다시 입력해 주세요.")
                                .alert(isPresented: $showingAlert){
                                    Alert(title: Text("회원가입 불가"),
                                    message: Text("같은 아이디가 있습니다."),
                                          dismissButton: .default(Text("확인")))
                                }
                        }else {
                            Button("Sign up", action: {}).disabled(true)
                        }
                    }
                }
                .background(Color.white)
            }
        }
        .hiddenNavigationBarStyle()
        .navigationViewStyle(StackNavigationViewStyle())
        //.navigationBarBackButtonHidden(true)
    }
    
    func signin() -> Bool {
        if(id != "" && password != "" && passwordCheck != "" && email != ""){
            return true
        }else{
            return false
        }
    }
    
    func signinCheck() -> Bool{
        if(id == "A"){
            return true
        }else{
            return false
        }
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13", "iPhone XS Max", "iPad (9th generation)"], id: \.self) { deviceName in
            Signup()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
