//
//  LoginCheck_View.swift
//  Clonet
//
//  Created by Jimin on 2022/02/09.
//

import SwiftUI
import Foundation
import SwiftGit2

struct LoginCheck_View: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var logincheck_ViewModel = LoginCheck_ViewModel()
    @State var userID: String

    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    Spacer()
                    Image("clonet_logo_white")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .offset(y: -130)
                        .padding(.bottom, -130)
                        .padding()
                        .accessibilityIdentifier("clonet_logo_white")

                    VStack(alignment: .center) {
                        Text(userID)
                            .font(.title)
                    }
                    .padding()
                    Button(action: { self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Logout")
                    }
                    Spacer()

                }
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            logincheck_ViewModel.loginCheck_alert(userID: userID)
                        }) {
                            Text("추가")
                        }
                        .padding()
                    }
                    List {
                        ForEach(logincheck_ViewModel.Repo_List, id: \.id) { s in
                            NavigationLink(destination: Repo_View(userID: userID, repoName: s.repo_name).onAppear(perform: {
                                deleteFile(repoName: s.repo_name)
                                cloneGitRepo(remoteRepoLocation: "http://13.209.116.111/git-repositories/" + s.repo_name + ".git", localRepoLocation: documentURL.appendingPathComponent(s.repo_name))
                            })) {
                                VStack {
                                    Text("\(s.repo_name)")
                                        .font(.title2)
                                }
                            }
                            .ignoresSafeArea(edges: .all)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .ignoresSafeArea(.all)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .hiddenNavigationBarStyle()
                }
            }.refreshable {
                logincheck_ViewModel.fetch(user_id: userID)
            }
        }
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .hiddenNavigationBarStyle()
        .onAppear {
            logincheck_ViewModel.fetch(user_id: userID)

        }

    }

    // MARK: Delete file
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    func deleteFile(repoName: String) {

        // delete File
        let fileManager = FileManager.default
        let path = documentsUrl.path

        do {
            try fileManager.removeItem(atPath: path + "/\(repoName)/")
            print("deletePath:", path + "/\(repoName)/")
        } catch let e {
            print("\(e)")
        }

    }

    // MARK: CLONE_FUNC
    func cloneGitRepo(remoteRepoLocation remoteRepoLocation: String, localRepoLocation localRepoLocation: URL) {
        let remote: URL = URL(string: remoteRepoLocation)!

        let result = Repository.clone(from: remote, to: localRepoLocation)
        switch result {
        case let .success(repo):
            let latestCommit = repo
                .HEAD()
                .flatMap {
                    repo.commit($0.oid)
                }

        case let .failure(error):
            print(error)
        }
    }
}
