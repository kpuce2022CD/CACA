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
            Repo_View_Directory()
//            Repo_View_Image()
            VStack{
                Repo_View_Request()
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
