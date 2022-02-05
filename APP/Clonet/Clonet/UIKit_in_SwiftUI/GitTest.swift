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
    let remoteRepoLocation = "http://52.79.235.187/git-repositories/PJY_JJANG.git"
    let test = "http://52.79.235.187/git-repositories/PJY_JJANG.git"
    
    init() {
        // git_libgit2_init()
        Repository.initialize_libgit2()
    }
    
    var body: some View {
        HStack{
            VStack {
                VStack{
                    Button("at", action: atGitRepo)
                    Button("Fake_LOCATION", action: location)
                    Button("clone", action: cloneGitRepo)
                    Button("at&add&commit&push", action: commitGitRepo)
                    Button("return remote Branch", action: return_remoteBranch)
                    Button("return local Branch", action: return_localBranch)
                }
                VStack{
                    Button("create local branch", action: create_localBranch)
                    Button("Checkout Branch", action: checkout_Branch)
                    Button("REVERT", action: revert)
                    Button("fetch", action: fetchGitRepo)
                    Button("MERGE", action: mergeGitRepo)
                }
            }
            VStack{
                ScrollView {
                    Text(message)
                    Text("\n zz")
                    Text(lastCMuser + lastCMmsg)
                    Text(lastCMtime.formatDate())
                }
            }.padding(5)
            
        }
        
    }
    
    // MARK: REVERT
    func revert(){
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            let revert_result = repo.revert_commit(repo)
            message = "\(revert_result)"
        case let .failure(error):
            message = "Could not open repository: \(error)"
        }
    }
    
    // MARK: CHECKOUT
    func checkout_Branch(){
        var branch_name = "remotes/origin/master"
        
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            let branch_commit = repo.checkout_branch(repo, branchName: branch_name)
        case let .failure(error):
            message = "Could not open repository: \(error)"
        }
    }
    
    
    // MARK: create Branch
    func create_localBranch(){
        var branch_name = "1327"
        
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            let sig = Signature(name: "name",email: "name@gmail.com",time: Date(),timeZone: TimeZone.current)
            let branch_commit = repo.commit(message: "create Branchname : " + branch_name, signature: sig)
            switch branch_commit{
            case let .success(commit):
                let createbranch_result = repo.create_localBranch(repo, at: commit, branch_name)
            case .failure(_):
                print("error")
            }
        case let .failure(error):
            message = "Could not open repository: \(error)"
        }
    }
    
    // MARK: return Branch (REMOTE)
    func return_remoteBranch(){
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            let remoteBranch_result = repo.remoteBranches()
            switch remoteBranch_result{
            case let .success(branch):
                message = "\(branch)"
            case let .failure(branch):
                message = "\(branch)"
            }
            
        case let .failure(error):
            message = "Could not open repository: \(error)"
        }
    }
    
    
    // MARK: return Branch (local)
    func return_localBranch(){
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            let remoteBranch_result = repo.localBranches()
            switch remoteBranch_result{
            case let .success(branch):
                message = "\(branch)"
            case let .failure(branch):
                message = "\(branch)"
            }
            
        case let .failure(error):
            message = "Could not open repository: \(error)"
        }
    }
    
    //MARK: COMMIT
    func commitGitRepo() {
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            //MARK: add
            let add_commit = repo.add(path: ".")
            
            //MARK: commit
            let sig = Signature(name: "name",email: "name@gmail.com",time: Date(),timeZone: TimeZone.current)
            let latestCommit = repo.commit(message: "asdf", signature: sig)
            
            //MARK: push
            let commit_push = repo.push(repo, "ubuntu", "qwer1234", nil)
            
            //            print(commit_push)
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
            message = "Could not clone repository: \(error)"
        }
    }
    
    //MARK: FETCH
    func fetchGitRepo(){
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            let remote = repo.remote(named: "origin")
            do {
                let remote_r = try remote.get()
                let fetch_result = repo.fetch(remote_r)
                switch fetch_result {
                case let .success(result):
                    message = "result : \(result)"
                case let .failure(error):
                    message = "error : \(error)"
                }
            }catch{
                print(error)
            }
        case let .failure(error):
            message = "\(error)"
        }
    }
    
    //MARK: MERGE
    func mergeGitRepo(){
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            let remote = repo.remote(named: "origin")
            do {
                let remote_r = try remote.get()
                let merge_result = repo.merge(repo)
                
                message = "merge result : \(merge_result)"

            }catch{
                print(error)
            }
        case let .failure(error):
            message = "\(error)"
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
                lastCMtime = commit.author.time
                
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
