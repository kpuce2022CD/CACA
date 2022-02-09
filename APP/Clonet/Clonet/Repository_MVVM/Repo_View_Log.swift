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
    @StateObject var log_repoViewModel_a = log_repo_ViewModel()
    //    @StateObject var log_list =log_repo_ViewModel()
    
    var body: some View {
        VStack{
            ForEach(log_repoViewModel_a.Log_repo_list, id: \.id) { s in
                VStack{
                    Text("commitMsg: \(s.commitMsg)")
                    Text("userId: \(s.userId)")
                    Text("commitId: \(log_repoViewModel_a.launches.commitId)")
                    Text("date: \(log_repoViewModel_a.launches.date)")
                    Text("--")
                }
            }
        }
        
    }
}

struct Repo_View_Log_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Log()
    }
}
