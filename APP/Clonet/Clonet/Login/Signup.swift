//
//  Signup.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/11.
//
import SwiftUI
import SocketIO

//회원가입 정보 보내기
final class Service_signup: ObservableObject {
    private var manager = SocketManager(socketURL: URL(string: "ws://localhost:3000")!, config: [.log(true), .compress])

    @Published var messages = [String]()
    @Published var signupJSON = ""
    @State var json: String = ""
    
    func signup_button(json: String){
        let socket = manager.defaultSocket
        socket.connect()        // 서버 연결
        
        socket.on(clientEvent: .connect){ (data, ack) in        // 서버와 연결되면 회원가입 정보 json 형식으로
            print("Connected")
            self.signupJSON = json
            socket.emit("signup", self.signupJSON)
            
//            sleep(5)
//            socket.disconnect()
        }
        
        socket.on("signup_result"){ [weak self] (data, ack) in
            print("datadataaa:", data)
            if let data = data[0] as? [String: String],
               let rawMessage = data["signup_RESULT"] {
                DispatchQueue.main.async {
                    self?.messages.append(rawMessage)
//                    print("rawMessage: ", data[0])
                    socket.disconnect()
                }
            }
        }
        
    
    }
}


struct Signup: View {
    @ObservedObject var service = Service_signup()
    
    @State var id = ""
    @State var password = ""
    @State var passwordCheck = ""
    @State var email = ""
    @State var name = ""
    @State var showingAlert = true // SignUP ERROR
    @State var selection: Int? = nil
    @State private var selectionString: String? = nil
    var body: some View {
        NavigationView{
            VStack(alignment: .center)  {
                
                // 회원가입 정보 JSON 변환
                var signupJSON = "{\"user_id\": \"\(self.id)\", \"user_pw\":\"\(self.password)\", \"user_name\":\"\(self.name)\", \"user_email\":\"\(self.email)\"}"
                
                Text("SIGN UP")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                /////////////////////////////////////////////////////////////////////////// // 서버에서 받아온 signup_result 출력
    //                ForEach(service.messages, id: \.self) { msg in
    //                    Text(msg).padding()
    //                }
                /////////////////////////////////////////////////////////////////////////////
                
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
                    
                    ZStack {
                        ForEach(service.messages, id: \.self) { msg in
                            if(msg == "TRUE"){
                                NavigationLink(destination: Login_View(), tag: "signupButton", selection: $selectionString) { }
                                .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                                Button("Sign UP") {
                                    self.selectionString = "signupButton"
                                    
                                }.alert(isPresented: $showingAlert) {
                                    Alert(title: Text("회원가입에 성공했습니다"), message: nil,
                                          dismissButton: .default(Text("확인")))
                                }
                            } else{
                                NavigationLink(destination: Signup(), tag: "signupButton", selection: $selectionString) { }
                                .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                                Button("Sign UP") {
                                    self.selectionString = "signupButton"
                                    
                                }.alert(isPresented: $showingAlert) {
                                    Alert(title: Text("회원가입에 실패했습니다"), message: nil,
                                          dismissButton: .default(Text("확인")))
                                }
                            }
                        }
                        Button("Sign UP") {
                            self.selectionString = "signupButton"
                            service.signup_button(json: signupJSON)
                        }
                    }
                }
                .background(Color.white)
            }
            .ignoresSafeArea(edges: .top)
        }
        .hiddenNavigationBarStyle()
        .navigationViewStyle(StackNavigationViewStyle())
        
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
