//
//  Repo_View.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI

struct Repo_View: View {
    var body: some View {
        HStack{
            VStack{
                Repo_View_Directory()
            }
            VStack{
                Repo_View_Request()
                Repo_View_Log(repo_n: "TEST")
                Repo_View_Git()
            }
        }
    }
}

struct Repo_View_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View()
    }
}
