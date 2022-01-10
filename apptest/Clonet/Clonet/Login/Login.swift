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
                    Button("ID 찾기") {
                        
                    }
                    Button("PASSWORD 찾기") {
                        
                    }
                }.padding()
            }
        }.navigationViewStyle(StackNavigationViewStyle())
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
        ForEach(["iPhone 13", "iPhone XS Max", "iPad (9th generation)"], id: \.self) { deviceName in
            Login()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
