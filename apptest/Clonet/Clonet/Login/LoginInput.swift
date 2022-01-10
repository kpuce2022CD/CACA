//
//  LoginInput.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/10.
//

import SwiftUI

struct LoginInput: View {
    @State var id : String = ""
    @State var passwd : String = ""
    
    var body: some View {
        VStack {
            HStack { // id input
                Image(systemName: "envelope").padding()
                TextField("ID/E-MAIL ADDRESS", text: $id).padding()
            }
            HStack { // passwd input
                Image(systemName: "lock").padding()
                TextField("PASSWORD", text: $passwd).padding()
            }
        }
    }

}

struct LoginInput_Previews: PreviewProvider {
    static var previews: some View {
        LoginInput()
    }
}
