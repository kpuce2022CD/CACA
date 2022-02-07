//
//  Repo_View_Git.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI
import SwiftGit2

struct Repo_View_Git: View {
    @ObservedObject var directory = getFileList()
    
    @State var RepositoryName = "test"
    @State var UserName = "UserName"
    @State var userEmail = "UserEmail"
    @State var remoteRepoLocation = "http://13.125.173.134/git-repositories/TEST.git"
    @State var commit_msg = "commit_msg"
    @State var branchArr : [String] = []
    
    @State private var showingAlert = false
    @State var revert_id : String = "9f0dffc923175290d2e975287c6c9ffc683fc7a4"
    init() {
        // git_libgit2_init()
        Repository.initialize_libgit2()
    }
    
    
    var body: some View {
        VStack{
            // MARK: RollBack Button : 아직 안됨 확인 필수!
            Button(action: {
                rollbackGit(localRepoLocation: documentURL.appendingPathComponent(RepositoryName), name: UserName, email: userEmail, commit_msg: commit_msg, revert_id: self.revert_id)
            }){
                HStack{
                    Image(systemName: "arrow.counterclockwise")
                    Text("RollBack")
                }
                
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 2)
                )
            }
            .background(Color.black)
            .cornerRadius(15)
            
            // MARK: Commit Button
            Button(action: {
                commitGitRepo(localRepoLocation: documentURL.appendingPathComponent(RepositoryName), name: UserName, email: userEmail, commit_msg: commit_msg)
            }){
                HStack{
                    Image(systemName: "opticaldiscdrive.fill")
                    Text("Commit")
                }
                
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 2)
                )
            }
            .background(Color.black)
            .cornerRadius(15)
            
            // Clone & Pull Button
            HStack{
                // MARK: Clone Button
                Button(action: {
                    cloneGitRepo(remoteRepoLocation: remoteRepoLocation, localRepoLocation: documentURL.appendingPathComponent(RepositoryName))
                    directory.location(repoName: RepositoryName)
                }){
                    HStack{
                        Image(systemName: "square.and.arrow.down")
                        Text("Clone")
                    }
                    
                    .frame(width: 100, height: 50)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.white, lineWidth: 2)
                    )
                }
                .background(Color.black)
                .cornerRadius(15)
                
                // MARK: Pull Button
                Button(action: {
                    
                }){
                    HStack{
                        Image(systemName: "square.and.arrow.down")
                        Text("Pull")
                    }
                    
                    .frame(width: 100, height: 50)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.white, lineWidth: 2)
                    )
                }
                .background(Color.black)
                .cornerRadius(15)
            }
            
            // MARK: Branch
            Button(action: {
                showingAlert = true
                branchArr = BranchGitRepo(localRepoLocation: documentURL.appendingPathComponent(RepositoryName))

            })
            {
                HStack{
                    Image(systemName: "arrow.triangle.branch")
                    Text("Branch")
                }
                
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 2)
                )
            }
            .background(Color.black)
            .cornerRadius(15)
            .alert("Branch", isPresented: $showingAlert){
                ForEach(branchArr, id: \.self){b in
                    Button(b){
                        checkout_Branch(localRepoLocation: documentURL.appendingPathComponent(RepositoryName), branchname: b)
                    }
                }
                Button("Cancel", role: .cancel){}
            }

            
            // MARK: Export
            Button(action: {
                
            }){
                HStack{
                    Image(systemName: "arrowshape.turn.up.forward.fill")
                    Text("Export")
                }
                
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 2)
                )
            }
            .background(Color.black)
            .cornerRadius(15)
        }
        .padding()
    }
    
    
    // MARK: ROLLBACK_FUNC
    func rollbackGit(localRepoLocation localRepoLocation: URL, name name: String, email email: String, commit_msg commit_msg : String, revert_id: String){
        var message : String
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            //MARK: revert
            let revert_result = repo.revert_commit(repo, revert_id: revert_id)
            
            //MARK: commit
            let sig = Signature(name: name,email: email, time: Date(),timeZone: TimeZone.current)
            let latestCommit = repo.commit(message: commit_msg, signature: sig)
            
            //MARK: push
            let commit_push = repo.push(repo, "ubuntu", "qwer1234", nil)
            message = "\(revert_result)"
            print(message)
        case let .failure(error):
            message = "Could not open repository: \(error)"
            print(message)
        }
    }
    
    
    //MARK: COMMIT_FUNC
    func commitGitRepo(localRepoLocation localRepoLocation: URL, name name: String, email email: String, commit_msg commit_msg : String) {
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            //MARK: add
            let add_commit = repo.add(path: ".")
            
            //MARK: commit
            let sig = Signature(name: name,email: email, time: Date(),timeZone: TimeZone.current)
            let latestCommit = repo.commit(message: commit_msg, signature: sig)
            
            //MARK: push
            let commit_push = repo.push(repo, "ubuntu", "qwer1234", nil)

            
        case let .failure(error):
            print(error)
        }
    }
    
    //MARK: CLONE_FUNC
    func cloneGitRepo(remoteRepoLocation remoteRepoLocation : String, localRepoLocation localRepoLocation : URL) {
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
    
    //MARK: Branch_Alert_FUNC
    func BranchGitRepo(localRepoLocation localRepoLocation : URL) -> [String]{
        
        // return Branch
        var resultBranch : [Branch] = []
        var branchArr : [String] = []
        
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            let remoteBranch_result = repo.localBranches()
            switch remoteBranch_result{
            case let .success(branch):
                resultBranch = branch
            case let .failure(branch):
                print(branch)
            }
        case let .failure(error):
            print(error)
        }
        
        // Filter Branch
        for i in 0..<resultBranch.count {
            var index = resultBranch.index(resultBranch.startIndex, offsetBy:i)
            var s = "\(resultBranch[index])"
            var branchName = s.split(separator: "\"")
            branchArr.append(String(branchName[3]))
        }
        print("branchArr")
        print(branchArr)
        
        return branchArr
    }

    
    //MARK: CHECKOUT_FUNC
    func checkout_Branch(localRepoLocation localRepoLocation : URL, branchname branch_name : String){
        let result = Repository.at(localRepoLocation)
        print("branch_name : ", branch_name)
        switch result {
        case let .success(repo):
            let branch_commit = repo.checkout_branch(repo, branchName: branch_name)
        case let .failure(error):
            print(error)
        }
    }
}

struct Repo_View_Git_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Git()
    }
}
