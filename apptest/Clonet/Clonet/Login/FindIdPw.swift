//
//  FindIdPw.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/11.
//

import SwiftUI

struct FindIdPw: View {
    @State var email = ""
    @State var showingAlert = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center)  {
                Text("FIND ID && PASSWORD")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Form{
                    Section(header: Text("FIND ID")) {
                        TextField("EMAIL", text: $email)
                            .padding()
                        
                        Button(action: {
                                    self.showingAlert = true
                                }) {
                                    Text("complete")
                                }
                                .alert(isPresented: $showingAlert) {
                                    Alert(title: Text("이메일을 발송하였습니다."), message: Text("입력하신 이메일을 확인해주세요"), dismissButton: .default(Text("확인")))
                                }
                    }
                    
                    
                    Section(header: Text("FIND PASSWORD")) {
                        TextField("EMAIL", text: $email)
                            .padding()
                        Button(action: {
                                    self.showingAlert = true
                                }) {
                                    Text("complete")
                                }
                                .alert(isPresented: $showingAlert) {
                                    Alert(title: Text("이메일을 발송하였습니다."), message: Text("입력하신 이메일을 확인해주세요"), dismissButton: .default(Text("확인")))
                                }
                    }
                }
            }
        }
        .hiddenNavigationBarStyle()
        .navigationViewStyle(StackNavigationViewStyle())
        //.navigationBarBackButtonHidden(true)
    
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
