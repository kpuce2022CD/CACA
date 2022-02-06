//
//  ContentView.swift
//  Clonet
//
//  Created by Jimin on 2022/01/10.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var launchViewModel: LaunchViewModel
    
    var body: some View {
        
        HStack {
            Text("Apollo")
//            ForEach(launchViewModel.launches){ launch in
//                Text(launch.id)
//            }
        }
        
//        LaunchViewModel()
//        Repo_View_Log()
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
