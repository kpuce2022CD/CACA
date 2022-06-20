//
//  ContentView.swift
//  Clonet
//
//  Created by Jimin on 2022/01/10.
//

import SwiftUI

struct ContentView: View {

    var userIP = "3.35.46.50"
    var body: some View {
        Login_View(userIP: userIP)
//        GitTest()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView().environmentObject(LaunchViewModel())
        ContentView()

    }
}
