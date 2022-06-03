//
//  Repo_View_Request.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI

struct Repo_View_Request: View {
    @StateObject var userViewModel = log_repo_ViewModel()
    @State var repoName: String

    init(repoName: String) {
        self.repoName = repoName
    }

    var body: some View {
        VStack {
            Spacer()
            List {
                Section(header: Text("User List").font(.title)) {
                    ForEach(userViewModel.User_repo_list, id: \.id) { i in
                        Text(i.user_id)
                    }.refreshable {
                        userViewModel.User_repo_list.removeAll()
                        userViewModel.getUserList(Repo_Name: repoName)
                    }
                }
            }
            Button(action: {
                userViewModel.appear()
                let alertHC = UIHostingController(rootView: AddUserAlert(repoName: repoName))

                alertHC.preferredContentSize = CGSize(width: 300, height: 265)
                alertHC.modalPresentationStyle = UIModalPresentationStyle.formSheet

                UIApplication.shared.windows[0].rootViewController?.present(alertHC, animated: true)}) {
                    Image(systemName: "person.crop.circle.fill.badge.plus")
                        .resizable()
                        .foregroundColor(Color.black)
                        .frame(width: 60, height: 50)
                }
        }
        .onAppear {
            userViewModel.getUserList(Repo_Name: repoName)
        }
    }
}

struct Repo_View_Request_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Request(repoName: "repoName")
    }
}
