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

//MARK: MAIN
struct GitTest: View {
    
    @State var message = ""
    @State var lastCMuser = ""
    @State var lastCMmsg = ""
    @State var lastCMtime = Date()

    
    let faceLocation = documentURL.appendingPathComponent("hey")
    let localRepoLocation = documentURL.appendingPathComponent("hey")
    let remoteRepoLocation = "http://54.180.94.152/git-repositories/PJY_JJANG.git"
    let test = "http://54.180.94.152/git-repositories/PJY_JJANG.git"
    
    init() {
        // git_libgit2_init()
        Repository.initialize_libgit2()
    }
    
    var body: some View {
        VStack {
            Button("Open test Git repo", action: atGitRepo)
            Button("LOCATION", action: location)
            Button("Clone remote Git repo", action: cloneGitRepo)
            Button("AT&ADD&COMMIT", action: commitGitRepo)
            ScrollView {
                Text(message)
                Text("\n zz")
                Text(lastCMuser + lastCMmsg)
                Text(lastCMtime.formatDate())
            }
        }.padding(5)
    }
    

    //MARK: COMMIT
    func commitGitRepo() {
        
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
//            OP = repo.pointer
            let add_commit = repo.add(path: ".")
            let sig = Signature(name: "name",email: "name@gmail.com",time: Date(),timeZone: TimeZone.current)
            let latestCommit = repo.commit(message: "asdf", signature: sig)
            
//            let _ = repo.push(<#T##repo: Repository##Repository#>, <#T##username: String##String#>, <#T##password: String##String#>, <#T##branch: String?##String?#>)
            let commit_push = repo.push(repo, "ubuntu", "qwer1234", nil)
            
//            print(commit_push)
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
    
    //MARK: CLONE
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
    
    //MARK: TEST
    func location(){
        let remote: URL = URL(string: remoteRepoLocation)!

        let result = Repository.clone(from: remote, to: faceLocation)
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
    
    // MARK: AT
    func atGitRepo() {
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


// MARK: Preview
struct GitTest_Previews : PreviewProvider {
    static var previews: some View {
        GitTest()
    }
}
