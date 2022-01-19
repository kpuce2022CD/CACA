//
//  GiteTest.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/10.
//


import SwiftUI
import SwiftGit2

let documentURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

extension Date {
        func formatDate() -> String {
                let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("EEEE, MMM d")
            return dateFormatter.string(from: self)
        }
}

struct GitTest: View {
    
    @State var message = ""
    @State var lastCMuser = ""
    @State var lastCMmsg = ""
    @State var lastCMtime = Date()
//
//    static let dateformat: DateFormatter = {
//           let formatter = DateFormatter()
//            formatter.dateFormat = "YYYY년 M월 d일"
//            return formatter
//        }()
//
    let localRepoLocation = documentURL.appendingPathComponent("naa")
    let remoteRepoLocation = "http://3.36.89.105/git-repositories/hye.git"
    let test = "http://3.36.89.105/git-repositories/hye.git"
    
    init() {
        // git_libgit2_init()
        Repository.initialize_libgit2()
    }
    
    var body: some View {
        VStack {
            Button("Open test Git repo", action: testGitRepo)
            Button("Clone remote Git repo", action: cloneGitRepo)
            Button("CREATE GIT REPOSITORY", action: createGitRepo)
            ScrollView {
                Text(message)
                Text("\n zz")
                Text(lastCMuser + lastCMmsg)
                Text(lastCMtime.formatDate())
            }
        }.padding(5)
    }
    
    func createGitRepo(){
        let remote: URL = URL(string: test)!
        let result = Repository.create(at: remote)
        switch result {
        case let .success(repo):
            let latestCommit = repo
                .HEAD()
                .flatMap {
                    repo.commit($0.oid)
                }
            
            switch latestCommit {
            case let .success(commit):
                message = "Latest Commit: \(commit.message) by \(commit.author.name)"
                
            case let .failure(error):
                message = "Could not get commit: \(error)"
            }
            
        case let .failure(error):
            message = "Could not open repository: \(error)"
        }
    }
    
    func cloneGitRepo() {
        let remote: URL = URL(string: remoteRepoLocation)!
        
        let result = Repository.clone(from: remote, to: localRepoLocation)
        switch result {
        case let .success(repo):
            let latestCommit = repo
                .HEAD()
                .flatMap {
                    repo.commit($0.oid)
                }
            
            switch latestCommit {
            case let .success(commit):
                message = "Latest Commit: \(commit.message) by \(commit.author.name) at \(commit.author.time)"
                lastCMmsg = commit.message
                lastCMuser = commit.author.name
               // lastCMtime = commit.author.time
                
            case let .failure(error):
                message = "Could not get commit: \(error)"
            }
            
        case let .failure(error):
            message = "Could not clone repository: \(error)"
        }
    }
    
    func getBranchList(){
        
    }
    
    func testGitRepo() {
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            let latestCommit = repo
                .HEAD()
                .flatMap {
                    repo.commit($0.oid)
                }
            
            switch latestCommit {
            case let .success(commit):
                message = "Latest Commit: \(commit.message) by \(commit.author.name) at \(commit.author.time)"
                
                lastCMmsg = commit.message
                lastCMuser = commit.author.name
                lastCMtime = commit.author.time
                
            case let .failure(error):
                message = "Could not get commit: \(error)"
            }
            
        case let .failure(error):
            message = "Could not open repository: \(error)"
        }
    }
}

struct GitTest_Previews : PreviewProvider {
    static var previews: some View {
        GitTest()
    }
}
