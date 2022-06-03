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

    func find_button(email: String) {
        let socket = manager.defaultSocket
        socket.connect()

        socket.on(clientEvent: .connect) { (_, _) in
            self.REemail = email
            socket.emit("IDEmail", self.REemail)

            sleep(2)
            socket.disconnect()
        }

        socket.on("find_result") { [weak self] (data, _) in
            //            print(email)
            //            print(data)
            if let data = data[0] as? [String: String],
               let rawMessage = data["find_RESULT"] {
                DispatchQueue.main.async {
                    self?.messages.append(rawMessage)
                    socket.disconnect()
                }
            }

            socket.connect()
        }

    }

}

struct FindIdPw: View {

    @ObservedObject var service = Service_FindPW()

    @State var email = ""
    @State var showingAlert = false

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                //                VStack{
                //
                //                    Text("Received messages form Node.js: ")
                //                    ForEach(service.messages, id: \.self) { msg in
                //                        Text(msg).padding()
                //                    }
                //                }

                Text("FIND ID && PASSWORD")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .ignoresSafeArea(edges: .bottom)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .hiddenNavigationBarStyle()

                Form {
                    Section(header: Text("FIND ID")) {
                        TextField("EMAIL", text: $email)
                            .padding()

                        if email == "" { // 이메일을 입력하지 않았을 경우
                            Button(action: {
                                self.showingAlert = true
                            }) {
                                Text("complete")
                            }
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text("이메일을 입력해주세요."), dismissButton: .default(Text("확인")))
                            }
                        } else {
                            Button(action: {
                                service.find_button(email: self.email)
                                self.showingAlert=true
                            }) {
                                Text("complete")
                            }
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text(email + "의 아이디 확인"), dismissButton: .default(Text("확인")))
                            }
                        }

                    }

                    Section(header: Text("FIND PASSWORD")) {
                        TextField("EMAIL", text: $email)
                            .padding()
                        Button(action: {
                            service.find_button(email: self.email)
                            self.showingAlert = true
                        }) {
                            Text("complete")
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text(email + "이메일을 발송하였습니다."), message: Text("입력하신 이메일을 확인해주세요"), dismissButton: .default(Text("확인")))
                        }
                    }
                }
            }
            //            .ignoresSafeArea(.container, edges: .top)
        }
        .hiddenNavigationBarStyle()
        .navigationViewStyle(StackNavigationViewStyle())
    }

    //    func EmailMatch() -> Bool{
    //        print("Matching")
    //        if(emailID == "DD"){
    //            return true
    //        }else{
    //            return false
    //        }
    //    }
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
