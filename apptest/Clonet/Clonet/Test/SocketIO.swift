//
//  ContentView.swift
//  Clonet
//
//  Created by Jimin on 2022/01/10.
//

import SwiftUI
import SocketIO
import zlib

final class Service: ObservableObject {
    private var manager = SocketManager(socketURL: URL(string: "ws://13.125.160.209:3000")!, config: [.log(true), .compress])
    
    @Published var messages = [String]()
    
    let json = """
[
    {
        "id": "aa54kk675thg32",
        "subject":"math",
        "grade":"A+"
    },
    {
        "id": "bb54kk675thg42",
        "subject":"english",
        "grade":"A0"
    },
    {
        "id": "cc54kk675thg52",
        "subject":"science",
        "grade":"B+"
    }
]
"""
    
    init(){
        let socket = manager.defaultSocket
        socket.on(clientEvent: .connect){ (data, ack) in
            print("Connected")
            socket.emit("NodeJS Server Port", self.json)
        }
        
        socket.on("iOS Client Port"){ [weak self] (data, ack) in
            if let data = data[0] as? [String: String],
               let rawMessage = data["msg"] {
                DispatchQueue.main.async {
                    self?.messages.append(rawMessage)
                }
            }
        }
        
        socket.connect()
    }
}

struct SocketIO: View {
    @ObservedObject var service = Service()
    
    var body: some View {
        GitTest()
        VStack{
            Text("Received messages form Node.js: ")
                .font(.largeTitle)
            ForEach(service.messages, id: \.self) { msg in
                Text(msg).padding()
            }
            Spacer()
        }
    }
}

struct SocketIO_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
