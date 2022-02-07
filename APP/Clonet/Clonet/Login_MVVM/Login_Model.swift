//
//  Login_Model.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import Foundation
import SocketIO
import Combine

//로그인 정보 보내기
final class Login_Model: ObservableObject {
    private var manager = SocketManager(socketURL: URL(string: "ws://localhost:3000")!, config: [.log(true), .compress])
    
    @Published var messages = [String]()
    @Published var loginJSON = ""
    @Published var json: String = ""
    
    func login_button(json: String){
        print("json: \(json)")
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
