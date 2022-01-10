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
    
    var body: some View {
        VStack {
            Spacer()
            Text("CLONET")
                .font(.title)
            Spacer()
            LoginInput().padding()
            LoginButton().padding()
            Spacer()
            LoginFind().padding()
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
