//
//  FindIdPw.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/11.
//

import SwiftUI
import MessageUI
import SocketIO

// 이메일 요청 보내기
final class Service_FindPW: ObservableObject {
    private var manager = SocketManager(socketURL: URL(string: "ws://localhost:3000")!, config: [.log(true), .compress])
    
    @Published var messages = [String]()
    @Published var REemail = ""
    @State var email: String = ""
    
    init(email: String, option: String){
        let socket = manager.defaultSocket
        
        if(option == "ID"){
            socket.on(clientEvent: .connect){ (data, ack) in
                print("Connected")
                print(email)
                self.REemail = email
                socket.emit("IDEmail", self.REemail)
                
                sleep(2)
                socket.disconnect()
            }
        }else if(option == "PASSWD"){
            socket.on(clientEvent: .connect){ (data, ack) in
                print("Connected")
                print(email)
                self.REemail = email
                socket.emit("EmailAddr", self.REemail)
                
                sleep(2)
                socket.disconnect()
            }
        }
        
        socket.on("FindID"){ [weak self] (data, ack) in
            print(email)
            print(data)
            if let data = data[0] as? [String: String],
               let rawMessage = data["msg"] {
                DispatchQueue.main.async {
                    self?.messages.append(rawMessage)
                    socket.disconnect()
                }
            }
        }
        
        socket.on("FindPW"){ [weak self] (data, ack) in
            print(email)
            print(data)
            if let data = data[0] as? [String: String],
               let rawMessage = data["msg"] {
                DispatchQueue.main.async {
                    self?.messages.append(rawMessage)
                    socket.disconnect()
                }
            }
        }
        socket.connect()
        
    }
    
}

struct FindIdPw: View {
    @State var emailID = ""
    @State var emailPWD = ""
    @State var option = ""
    @State var showingAlert = false
    
    @ObservedObject var service = Service()
    
    var body: some View {
        NavigationView{

//            VStack{
//                Text("Received messages form Node.js: ")
//                    .font(.largeTitle)
//                ForEach(service.messages, id: \.self) { msg in
//                    Text(msg).padding()
//                }
//                Spacer()
//            }
            
            VStack(alignment: .center)  {
                Text("FIND ID && PASSWORD")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Text("Received messages form Node.js: ")
                ForEach(service.messages, id: \.self) { msg in
                    Text(msg).padding()
                }
                
                Form{
                    Section(header: Text("FIND ID")) {
                        TextField("EMAIL", text: $emailID)
                            .padding()
                        
                        if(emailID == ""){ // 이메일을 입력하지 않았을 경우
                            Button(action: {
                                self.showingAlert = true
                            }) {
                                Text("complete")
                            }
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text("이메일을 입력해주세요."), dismissButton: .default(Text("확인")))
                            }
                        }else{
                                Button(action: {
                                    option = "ID"
                                    Service_FindPW(email: emailID, option: option )
                                    self.showingAlert=true
                                }){
                                    Text("complete")
                                }
                                .alert(isPresented: $showingAlert){
                                    Alert(title: Text(emailID + "의 아이디 확인"),dismissButton: .default(Text("확인")))
                                }
                            }
                        
                    }
                    
                    
                    Section(header: Text("FIND PASSWORD")) {
                        TextField("EMAIL", text: $emailPWD)
                            .padding()
                        Button(action:  {
                            option = "PASSWD"
                            Service_FindPW(email: emailPWD, option: option)
                            self.showingAlert = true
                                }) {
                                    Text("complete")
                                }
                                .alert(isPresented: $showingAlert) {
                                    Alert(title: Text(emailPWD + "이메일을 발송하였습니다."), message: Text("입력하신 이메일을 확인해주세요"), dismissButton: .default(Text("확인")))
                                }
                    }
                }
            }
        }
        .hiddenNavigationBarStyle()
        .navigationViewStyle(StackNavigationViewStyle())
        //.navigationBarBackButtonHidden(true)
    }
    
    func EmailMatch() -> Bool{
        print("Matching")
        if(emailID == "DD"){
            return true
        }else{
            return false
        }
    }
}

struct FindIdPw_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13", "iPhone XS Max", "iPad (9th generation)"], id: \.self) { deviceName in
            FindIdPw()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
