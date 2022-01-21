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
    
    @State var OP : OpaquePointer? = nil
    
    
    let faceLocation = documentURL.appendingPathComponent("baa")
    let localRepoLocation = documentURL.appendingPathComponent("a")
    let remoteRepoLocation = "http://54.180.94.152/git-repositories/PJY_JJANG.git"
    let test = "http://54.180.94.152/git-repositories/PJY_JJANG.git"
    
    init() {
        // git_libgit2_init()
        Repository.initialize_libgit2()
    }
    
    var body: some View {
        VStack {
            Button("Open test Git repo", action: testGitRepo)
//            Button("LOCATION", action: location)
            Button("Clone remote Git repo", action: cloneGitRepo)
            Button("CREATE GIT REPOSITORY", action: createGitRepo)
            Button("AT&ADD&COMMIT", action: commitGitRepo)
            ScrollView {
                Text(message)
                Text("\n zz")
                Text(lastCMuser + lastCMmsg)
                Text(lastCMtime.formatDate())
            }
        }.padding(5)
    }
    
    func commitGitRepo() {
        
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            OP = repo.pointer
            let add_commit = repo.add(path: ".")
            let sig = Signature(name: "name",email: "name@gmail.com",time: Date(),timeZone: TimeZone.current)
            let latestCommit = repo.commit(message: "asdf", signature: sig)
            
            let remote: URL = URL(string: remoteRepoLocation)!
            let commit_commit = repo.commit(message: "asdf", signature: sig)
            
            let commit_push = repo.push(repo, "ubuntu", "asdfqwer", "master")
            
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
    
//    func location(){
//        let remote: URL = URL(string: remoteRepoLocation)!
//
//        let result = Repository.clone(from: remote, to: faceLocation)
//        switch result {
//        case let .success(repo):
//            let latestCommit = repo
//                .HEAD()
//                .flatMap {
//                    repo.commit($0.oid)
//                }
//
//            switch latestCommit {
//            case let .success(commit):
//                message = "Latest Commit: \(commit.message) by \(commit.author.name) at \(commit.author.time)"
//                lastCMmsg = commit.message
//                lastCMuser = commit.author.name
//               // lastCMtime = commit.author.time
//
//            case let .failure(error):
//                message = "Could not get commit: \(error)"
//            }
//
//        case let .failure(error):
//            message = "Could not clone repository: \(error)"
//        }
//    }
    
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
//
//struct GitTest_Previews : PreviewProvider {
//    static var previews: some View {
//        GitTest(POINTER: Repository)
//    }
//}
