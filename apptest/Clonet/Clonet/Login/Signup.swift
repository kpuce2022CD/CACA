//
//  Signup.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/11.
//
import SwiftUI

struct Signup: View {
    @State var id = ""
    @State var password = ""
    @State var passwordCheck = ""
    @State var email = ""
    @State var showingAlert = true // SignUP ERROR
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center)  {
                Text("SIGN UP")
                    .font(.title)
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
                    
                    if(signin() && !signinCheck()){
                        NavigationLink(destination: Login(), label: {Text("COMPLETE")})
                    }else if(signin() && signinCheck()){
                        Text("다시 입력해 주세요")
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text("회원가입 불가"), message: Text("같은 아이디가 있습니다."), dismissButton: .default(Text("확인")))
                            }
                    }
                }
                .background(Color.white)
            }
        }
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
