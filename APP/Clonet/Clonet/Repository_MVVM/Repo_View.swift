//
//  Repo_View.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI

struct Repo_View: View {
    var userID : String = ""
    var repoName : String = ""
    
    init(userID: String, repoName: String){
        self.userID = userID
        self.repoName = repoName
    }
    
    var body: some View {
        HStack{
            VStack{
                Repo_View_Directory()
            }
            VStack{
                Repo_View_Request()
                Repo_View_Log(repo_n: repoName)
                Repo_View_Git(repo_n: repoName, userID: userID)
            }
        }
    }
}

struct Repo_View_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View(userID: "", repoName: "")
    }
}
