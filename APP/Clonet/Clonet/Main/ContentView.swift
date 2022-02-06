//
//  ContentView.swift
//  Clonet
//
//  Created by Jimin on 2022/01/10.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var launchViewModela: LaunchViewModel
    
    var body: some View {
        
//        VStack {
//            Text("Apollo")
//            Text("\(launchViewModela.launches.cursor)")
//            Text("\(String(launchViewModela.launches.hasMore))")
//
//        }
        
//        LaunchViewModel()
        Repo_View()
//        Repo_Home(repoName: "repoName", user_id: "user_Id", branch: ["branch1", "branch2"])
//        GitTest()
//        Login()
        // ActivityIndicatorDemo()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LaunchViewModel())
    }
}
