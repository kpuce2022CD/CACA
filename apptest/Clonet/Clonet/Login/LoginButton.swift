//
//  LoginButton.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/10.
//

import SwiftUI

struct LoginButton: View {
    @State private var isOn = true
    
    var body: some View {
        VStack{
            
            Toggle(isOn: $isOn) {
                Text("AUTO")
            }
            .frame(width: 130, height: 40)
            .padding()
            
            Button(action: { }) {
                Text("LOGIN")
                    .frame(width: 100, height: 40)
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
            }
            .padding()
        }
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton()
    }
}
