//
//  Repo_View_Git.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI
import SwiftGit2

struct Repo_View_Git: View {
    
    @State var RepositoryName = "hey"
    @State var UserName = "UserName"
    @State var userEmail = "UserEmail"
    @State var remoteRepoLocation = "http://52.79.235.187/git-repositories/PJY_JJANG.git"
    @State var commit_msg = "commit_msg"
    
    init() {
        // git_libgit2_init()
        Repository.initialize_libgit2()
    }
    
    
    var body: some View {
        VStack{
            // MARK: RollBack Button
            Button(action: {
                
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
                BranchGitRepo(localRepoLocation: documentURL.appendingPathComponent(RepositoryName))
            }){
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
            print("COMMIT FAIL")
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
            print("CLONE FAIL")
        }
    }
    
    //MARK: Branch_Alert_FUNC
    func BranchGitRepo(localRepoLocation localRepoLocation : URL){
        let alert = UIAlertController(title: "브랜치", message: "변경할 브랜치를 선택하세요", preferredStyle: UIAlertController.Style.alert)
        
        let defaultAction =  UIAlertAction(title: "Create Branch", style: UIAlertAction.Style.default)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        
        // return Branch
        var resultBranch : [Branch] = []
        var branchArr : [String] = []
        
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            let remoteBranch_result = repo.remoteBranches()
            switch remoteBranch_result{
            case let .success(branch):
                resultBranch = branch
            case let .failure(branch):
                print("return Branch FAIL")
            }
        case let .failure(error):
            print("return Branch FAIL")
        }
        
        // Filter Branch
        for i in 0..<resultBranch.count {
            var index = resultBranch.index(resultBranch.startIndex, offsetBy:i)
            var s = "\(resultBranch[index])"
            var branchName = s.split(separator: "\"")
            branchArr.append(String(branchName[3]))
        }
        
        for branchArr_number in branchArr {
            let destructiveAction = UIAlertAction(title: branchArr_number, style: UIAlertAction.Style.destructive){(_) in
                // 버튼 클릭시 실행되는 코드 // Checkout
                checkout_Branch(localRepoLocation: localRepoLocation, branchname: branchArr_number)
            }
            alert.addAction(destructiveAction)
        }

        
        

    }
    
    //MARK: CHECKOUT_FUNC
    func checkout_Branch(localRepoLocation localRepoLocation : URL, branchname branchname : String){
        var branch_name = "remotes/origin/" + branchname
        
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            let branch_commit = repo.checkout_branch(repo, branchName: branch_name)
        case let .failure(error):
            print("CHECKOUT FAIL")
        }
    }
}

struct Repo_View_Git_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Git()
    }
}
