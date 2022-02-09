//
//  Repo_View_Log.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI
import Foundation
import Apollo

struct Repo_View_Log: View {
    @StateObject var log_repoViewModela = log_repo_ViewModel()
    
    var body: some View {
        VStack{
            Text("commitMsg: \(log_repoViewModela.launches.commitMsg)")
            Text("userId: \(log_repoViewModela.launches.userId)")
            Text("commitId: \(log_repoViewModela.launches.commitId)")
            Text("date: \(log_repoViewModela.launches.date)")
        }
//        List{
//            ForEach(GetRepoName.str2, id: \.self) { i in
//
//                NavigationLink(destination: Repo_Home(repoName: i, user_id: userID, branch: branchArr)){
//                    VStack{
//                        Text(i).padding()
//                            .padding(2)
//                            .font(.title3)
//                    }
//                }
//            }
//            .buttonStyle(PlainButtonStyle())
//            .onAppear {
//            }
//        }
    }
}

struct Repo_View_Log_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Log()
    }
}
