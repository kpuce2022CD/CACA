//
//  FindIdPw.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/11.
//

import SwiftUI
import MessageUI

struct FindIdPw: View {
    @State var emailID = ""
    @State var emailPWD = ""
    @State var showingAlert = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center)  {
                Text("FIND ID && PASSWORD")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Form{
                    Section(header: Text("FIND ID")) {
                        TextField("EMAIL", text: $emailID)
                            .padding()
                        
                        if(EmailMatch()){
                            Button(action: {
                                self.showingAlert = true
                                }) {
                                Text("complete")
                                }
                                .alert(isPresented: $showingAlert) {
                                    Alert(title: Text("아이디 확인"), message: Text(emailID + "의 id는 B입니다"), dismissButton: .default(Text("확인")))
                                }
                        }else if(emailID == ""){
                            Button(action: {
                                self.showingAlert = true
                                }) {
                                Text("complete")
                                }
                                .alert(isPresented: $showingAlert) {
                                    Alert(title: Text("이메일을 입력해주세요."), dismissButton: .default(Text("확인")))
                                }
                        }else if(!EmailMatch()){
                            Button(action: {
                                self.showingAlert = true
                                }) {
                                Text("complete")
                                }
                                .alert(isPresented: $showingAlert) {
                                    Alert(title: Text("아이디 확인 불가"), message: Text("입력하신 이메일을 확인해주세요."), dismissButton: .default(Text("확인")))
                                }
                        }
                        
                        
                        
//                        Button(action: {
//                                    self.showingAlert = true
//                                }) {
//                                    Text("complete")
//                                }
//                                .alert(isPresented: $showingAlert) {
//                                    Alert(title: Text("이메일을 발송하였습니다."), message: Text("입력하신 이메일을 확인해주세요"), dismissButton: .default(Text("확인")))
//                                }
                    }
                    
                    
                    Section(header: Text("FIND PASSWORD")) {
                        TextField("EMAIL", text: $emailPWD)
                            .padding()
                        Button(action: {
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
