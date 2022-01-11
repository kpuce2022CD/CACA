//
//  LoginCheck.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/10.
//

import SwiftUI

struct LoginCheck: View {
    @State var id = ""
    
    var body: some View {
        NavigationView{
            Text(id)
        }
        .hiddenNavigationBarStyle()
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginCheck_Previews: PreviewProvider {
    static var previews: some View {
        LoginCheck(id: "asdf")
    }
}
