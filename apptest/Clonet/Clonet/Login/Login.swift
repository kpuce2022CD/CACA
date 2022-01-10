//
//  Login.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/10.
//

import SwiftUI

struct Login: View {
    @State var id : String = ""
    @State var passwd : String = ""
    @State var isOn = true

    var body: some View {
        NavigationView{
            VStack {
                // title
                Spacer()
                Text("CLONET")
                    .font(.title)
                Spacer()
                
                // input
                VStack {
                    HStack { // id input
                        Image(systemName: "envelope").padding()
                        TextField("ID", text: $id).padding()
                    }
                    HStack { // passwd input
                        Image(systemName: "lock").padding()
                        TextField("PASSWORD", text: $passwd).padding()
                    }
                    
                    
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
                    
                    // LOGIN BUTTON
//                    Button(action: login) {
//                        Text("LOGIN")
//                    }
//                    .frame(width: 100, height: 40)
//                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                    
                }
                
                // ID PASSWORD FIND
                Spacer()
                HStack (spacing:20) {
                    Button("ID 찾기") {
                        
                    }
                    Button("PASSWORD 찾기") {
                        
                    }
                }.padding()
            }
        }
    }
    
    func login() -> Bool {
        // let loginID = User(id: id, password: passwd)
        if(id == "B" && passwd == "A"){
            return true
        }else{
            return false
        }

    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
