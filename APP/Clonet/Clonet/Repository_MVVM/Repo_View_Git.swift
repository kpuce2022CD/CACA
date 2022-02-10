//
//  Repo_View_Git.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI
import SwiftGit2
import ToastUI

struct Repo_View_Git: View {
    @ObservedObject var directory = getFileList()
    
    @State var RepositoryName = "test"
    @State var UserName = "UserName"
    @State var userEmail = "UserEmail"
    @State var remoteRepoLocation = "http://3.34.194.172/git-repositories/ho.git"
    @State var commit_msg = "commit_msg"
    @State var branchArr : [String] = []
    
    @State private var showingAlert = false
    @State var revert_id : String = "f6208e911787230629069d9f0586df1f1ea2d27b"
    @State var merge_id : String = "752aa0ffa6ff9cbd69fbfaa7abc7cf0408cb7244"
    @State var addFileName : String = "."
    
    @State private var presentingToast: Bool = false
    
    init() {
        Repository.initialize_libgit2()
    }
    
    var body: some View {
        VStack{
            // MARK: RollBack Button
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
                alertView()
//                commitGitRepo(localRepoLocation: documentURL.appendingPathComponent(RepositoryName), name: UserName, email: userEmail, commit_msg: commit_msg)
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
                    // MARK: FETCH
                    fetchGitRepo(localRepoLocation: documentURL.appendingPathComponent(RepositoryName))
                    // MARK: MERGE
                    mergeGitRepo(localRepoLocation: documentURL.appendingPathComponent(RepositoryName),remoteRepoLocation: remoteRepoLocation, hexString: merge_id)
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
            
            // MARK: Branch Button
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

            
            // MARK: Export Button
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

        
        
        // MARK: Diff Button
        Button(action: {
            presentingToast = true
        }){
            HStack{
                Image(systemName: "slider.horizontal.below.square.filled.and.square")
                Text("Compare")
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
        .toast(isPresented: $presentingToast, dismissAfter: 2.0){
            ToastView {
                VStack{
                    Text("hello")
                }
            }
        }
            
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
    func commitGitRepo(localRepoLocation localRepoLocation: URL, name name: String, email email: String, commit_msg commit_msg : String, addFileName addFileName: String) {
        print("commit btn clicked!! ")
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            //MARK: add
            let add_commit = repo.add(path: addFileName)
            
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
    
    //MARK: FETCH_FUNC
    func fetchGitRepo(localRepoLocation localRepoLocation:URL){
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            let remote = repo.remote(named: "origin")
            do {
                let remote_r = try remote.get()
                let fetch_result = repo.fetch(remote_r)
                switch fetch_result {
                case let .success(result):
                    let message = "result : \(result)"
                    print("fetch1 result: \(result)")
                case let .failure(error):
                    let message = "error : \(error)"
                    print("fetch1 error: \(error)")
                }
            }catch{
                print(error)
            }
        case let .failure(error):
            let message = "\(error)"
            print("fetch1 failed: \(error)")
        }
    }
    
    //MARK: MERGE_FUNC
    func mergeGitRepo(localRepoLocation localRepoLocation: URL, remoteRepoLocation remoteRepoLocation : String, hexString : String){
        let result = Repository.at(localRepoLocation)
        let hexString = hexString
        
        switch result {
        case let .success(repo):
            let remote = repo.remote(named: "origin")
            do {
                let remote_r = try remote.get()
                let merge_result = repo.merge_func(repo, remoteRepoLocation: remoteRepoLocation, hexString: hexString )

                let message = "merge result : \(merge_result)"

            }catch{
                print(error)
            }
        case let .failure(error):
            let message = "\(error)"
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
    
    // MARK: alertView
    func alertView(){
        print("!!commit alertView clicked")
        let alert = UIAlertController(title: "commig message", message: "Enter your message", preferredStyle: .alert)
        
        alert.addTextField{ i in
            i.placeholder = "commit msg"
        }
        
        let completeAction = UIAlertAction(title: "Save", style: .default){ (_) in
            print("complete clicked")
            commit_msg = alert.textFields![0].text!
            print("commit complete: \(commit_msg)")
            commitGitRepo(localRepoLocation: documentURL.appendingPathComponent(RepositoryName), name: UserName, email: userEmail, commit_msg: commit_msg, addFileName: addFileName)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive){ (_) in
            print("cancel clicked")
        }
        
        alert.addAction(completeAction)
        alert.addAction(cancelAction)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {
            
        })
        
    }
}

struct Repo_View_Git_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Git()
    }
}
