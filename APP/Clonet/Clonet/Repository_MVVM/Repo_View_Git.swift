//
//  Repo_View_Git.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI
import SwiftGit2
import ToastUI


class LogNumber : ObservableObject {
    @Published var url1 : String = ""
    @Published var url2 : String = ""
}

class BranchName : ObservableObject{
    @Published var currentBranchName : String = "master"
    init(){
        currentBranchName = "master"
    }
}

class LogList : ObservableObject {
    @Published var Log_repo_list : Array<Log_repo> = []
    init(){
        Log_repo_list = Array<Log_repo>.init()
    }
}

struct Repo_View_Git: View {
    @ObservedObject var directory = getFileList()
    @StateObject var logNumber : LogNumber = LogNumber()
    
    @State var UserName = ""
    @State var userEmail = "UserEmail"
    @State var commit_msg = ""
    @State var branchArr : [String] = []
    
    @State private var showingAlert = false
    @State private var showingAlert_makeBranch = false
    @State var merge_id : String = ""
    @State var addFileName : String = "."
    
    // Toast Variables
    @State var repo_n: String
    @State var userID: String
    @ObservedObject var log_repoViewModel_a = log_repo_ViewModel()
    @State private var presentingToast: Bool = false
    @State private var presentingToast2: Bool = false
    @State private var presentingToast_pull: Bool = false
    @State private var presentingToast_commit: Bool = false
    
    // Diff
    @State var log_number1 = 0
    @State var log_number2 = 0
    @State private var file_number = 0
    @State private var FileList = getFileList()
    @State private var presentingToast3: Bool = false
    @State private var selectionString: String? = nil
    
    // 현재 브랜치 이름
    @ObservedObject var branchNameObject : BranchName
    // log
    @ObservedObject var Log_repo_list : LogList
    
    // init
    init(repo_n: String, userID: String, branchName: BranchName) {
        self.repo_n = repo_n
        Repository.initialize_libgit2()
        self.userID = userID
        self.branchNameObject = BranchName.init()
        self.Log_repo_list = LogList.init()
        self.getBranchLog()
    }
    ////
    var body: some View {
        
        VStack{
            
            // MARK: RollBack Button
            Button(action: {
                presentingToast = true
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
            }.toast(isPresented: $presentingToast){ // , dismissAfter: 2.0
                ToastView {
                    NavigationView {
                        Form {
                            Section {
                                Picker("Choose Roll Back Commit", selection: $log_number1) {
                                    ForEach(log_repoViewModel_a.Log_repo_list.indices) {
                                        Text("\(log_repoViewModel_a.Log_repo_list[$0].userId) : \(log_repoViewModel_a.Log_repo_list[$0].commitMsg)")
                                    }
                                }
                            }
                            Section{
                                Button {
                                    presentingToast = false
                                    rollbackGit(localRepoLocation: documentURL.appendingPathComponent(repo_n), name: userID, email: userEmail, commit_msg: commit_msg, reset_id: log_repoViewModel_a.Log_repo_list[log_number1].commitId)
                                } label: {
                                    Text("OK")
                                }
                                Button {
                                    presentingToast = false
                                } label: {
                                    Text("CANCEL")
                                }
                                
                            }
                        }
                    }
                }
            }
            .background(Color.black)
            .cornerRadius(15)
            
            // MARK: Commit Button
            Button(action: {
                presentingToast_commit = true
                branchArr = BranchGitRepo(localRepoLocation: documentURL.appendingPathComponent(repo_n))
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
            .toast(isPresented: $presentingToast_commit){ // , dismissAfter: 2.0
                ToastView {
                    Text("Commit Message")
                    TextField("Enter Commit Message", text: $commit_msg).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                    Divider()
                    HStack{
                        Button("Save", action: {
                            presentingToast_commit = false
                            
                            commitGitRepo(localRepoLocation: documentURL.appendingPathComponent(repo_n), name: userID, email: userEmail, commit_msg: commit_msg, addFileName: addFileName)
                        })
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 40, maxHeight: 40, alignment: .center)
                        Divider()
                        Button("Cancel", role: .cancel){
                            presentingToast_commit = false
                        }
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 40, maxHeight: 40, alignment: .center)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                }.frame(width: 300)
            }

            
            // MARK: Branch Button
            HStack{
                Button(action: {

                    showingAlert = true
                    branchArr = BranchGitRepo(localRepoLocation: documentURL.appendingPathComponent(repo_n))
                    for i in branchArr.indices{ // origin 빼고 branch 이름만 띄우기
                        branchArr[i] = branchArr[i].components(separatedBy: "/")[1]
                    }
                    
                })
                {
                    HStack{
                        Image(systemName: "arrow.triangle.branch")
                        Text("Change")
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
                .alert("Branch", isPresented: $showingAlert){
                    ForEach(branchArr, id: \.self){b in
                        Button(b){
                            // checkout
                            checkout_Branch(localRepoLocation: documentURL.appendingPathComponent(repo_n), branchname: b)
                            
                            // 현재 branchName 표시
                            branchNameObject.currentBranchName = b
                            
                            
                        }
                    }
                    Button("Cancel", role: .cancel){}
                }

                
                
                //MARK: Make Branch
                Button(action: {
                    let alertHC = UIHostingController(rootView: createBranch_View(localRepoLocation: repo_n, name: userID, email: userEmail))
                    
                    alertHC.preferredContentSize = CGSize(width: 300, height: 200)
                    alertHC.modalPresentationStyle = UIModalPresentationStyle.formSheet
                    
                    UIApplication.shared.windows[0].rootViewController?.present(alertHC, animated: true)
                    
                })
                {
                    HStack{
                        Image(systemName: "arrow.triangle.branch")
                        Text("Create")
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
            
            
            
            // MARK: Diff Button
            Button(action: {
                presentingToast2 = true
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
            .toast(isPresented: $presentingToast2){ // , dismissAfter: 2.0
                ToastView {
                    NavigationView {
                        Form {
                            Section {
                                Picker("Choose First Diff Commit", selection: $log_number1) {
//                                    ForEach(Log_repo_list, id: \.id){ index in
//                                        Text(index.userId + " : " + index.commitMsg)
//                                    }
                                    ForEach(Log_repo_list.Log_repo_list.indices) {
                                        Text("\(Log_repo_list.Log_repo_list[$0].userId) : \(Log_repo_list.Log_repo_list[$0].commitMsg)")
                                    }
                                }
                                Picker("Choose Second Diff Commit", selection: $log_number2) {
                                    ForEach(Log_repo_list.Log_repo_list.indices) {
                                        Text("\(Log_repo_list.Log_repo_list[$0].userId) : \(Log_repo_list.Log_repo_list[$0].commitMsg)")
                                    }
                                }
                                Picker("Choose File", selection: $file_number) {
                                    ForEach(FileList.items.indices) {
                                        if(FileList.items[$0] != ".git"){
                                            Text("\(FileList.items[$0])")
                                        }
                                    }
                                }
                            }.onAppear(){
                                // reLoad branch Log
                                self.getBranchLog()
                            }
                            
                            
                            Section{
                                ZStack {
                                    NavigationLink(destination: Repo_View_Diff(ImgOpacity: 0.5, logNumber: logNumber)) { }
                                    .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                                    
                                    Button {
                                        self.selectionString = "true"
                                        logNumber.url1 = "http://13.209.116.111/images/\( Log_repo_list.Log_repo_list[log_number1].commitId)_\(FileList.items[file_number])"
                                        
                                        logNumber.url2 = "http://13.209.116.111/images/\( Log_repo_list.Log_repo_list[log_number2].commitId)_\(FileList.items[file_number])"
                                        
                                        
                                        log_repoViewModel_a.Diff(first_commit: Log_repo_list.Log_repo_list[log_number1].commitId, second_commit: Log_repo_list.Log_repo_list[log_number2].commitId, repo_name: repo_n, file_name: FileList.items[file_number])
                                        
                                        print("logNumber.url1", logNumber.url1)
                                    } label: {
                                        Text("OK")
                                    }
                                    
                                }
                                
                                Button {
                                    presentingToast2 = false
                                } label: {
                                    Text("CANCEL")
                                }
                            }
                        }
                    }
                }
            }
            .onAppear(){
                // reLoad branch Log
                self.getBranchLog()
                
                // Directory
                FileList.first(repo_n: repo_n)
                FileList.location(repoName: repo_n)
            }
            .padding()
        }
    }
    
    
    // MARK: ROLLBACK_FUNC
    func rollbackGit(localRepoLocation localRepoLocation: URL, name name: String, email email: String, commit_msg commit_msg : String, reset_id: String){
        var message : String = ""
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            
            //MARK: reset
            let reset_result = repo.log_reset(repo, reset_id: reset_id ?? "")
            
            //MARK: push_force
            let commit_push_force = repo.push_force(repo, "ubuntu", "qwer1234", nil)
            print(message)
        case let .failure(error):
            message = "Could not open repository: \(error)"
            print(message)
        }
        
    }
    
    
    
    //MARK: COMMIT_FUNCgetUserList
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
            let commit_push = repo.push(repo, "ubuntu", "qwer1234", branchNameObject.currentBranchName)
            
            
        case let .failure(error):
            print(error)
        }
    }
    
    //MARK: PUSH_FORCE
    public func push_f_GitRepo(localRepoLocation localRepoLocation : URL){
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            //MARK: push
            let commit_push = repo.push_force(repo, "ubuntu", "qwer1234", nil)
            
        case let .failure(error):
            print("\(error)")
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
                    print("fetch1 result: \(result)")
                case let .failure(error):
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
        
        switch result {
        case let .success(repo):
            let remote = repo.remote(named: "origin")
            do {
                let remote_r = try remote.get()
                let merge_result = repo.merge_func(repo, remoteRepoLocation: remoteRepoLocation, hexString: hexString )
                print("hexString", hexString)
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
            let remoteBranch_result = repo.remoteBranches()
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
        switch result {
        case let .success(repo):
//          create Locoal Branch AND CHECKOUT
            var resultClone = repo.checkoutTOLocalBranch(repo, branchName: branch_name)
            
            //
            repo.branchLog(repo, branchNameObject.currentBranchName)

        case let .failure(error):
            print(error)
        }
    }
    
    // MARK: get Branch Log List
    func getBranchLog(){
        let localRepoLocation = documentURL.appendingPathComponent(repo_n)
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            Log_repo_list.Log_repo_list.removeAll()
            
            Log_repo_list.Log_repo_list = repo.branchLog(repo, self.branchNameObject.currentBranchName).map({
                Log_repo.init(log: $0 as! Log_repo)
            })
            break
        case .failure(_):
            break
        }
    }
    
}

struct Repo_View_Git_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Git(repo_n: "", userID: "", branchName: BranchName.init())
    }
}



struct createBranch_View: View {
    
    // 새로운 브랜치 이름
    @State private var new_branch_name: String = ""
    
    var localRepoLocation : String
    var name : String
    var email : String
    
    var body: some View {
        
        VStack {
            Text("Enter Input Branch Name").font(.headline).padding()
            
            TextField("Enter Input Branch Name.", text: $new_branch_name).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            
            Divider()
            HStack {
                Spacer()
                Button(action: {
                    create_Branch(localRepoLocation: documentURL.appendingPathComponent(localRepoLocation), branch_name: new_branch_name, name: name, email: email)
                
                    
                    UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                }) {
                    
                    Text("Done")
                }
                Spacer()
                
                Divider()
                
                Spacer()
                Button(action: {
                    UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                }) {
                    Text("Cancel")
                }
                Spacer()
            }.padding(0)
            
            
        }.background(Color(white: 0.9))
    }
    
    
    //MARK: Make Branch FUNC
    func create_Branch(localRepoLocation localRepoLocation : URL, branch_name branch_name : String, name name: String, email email: String){
        
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            let sig = Signature(name: name,email: email, time: Date(),timeZone: TimeZone.current)
            let branch_commit = repo.commit(message: "create Branchname : " + branch_name, signature: sig)
            switch branch_commit{
            case let .success(commit):
                let createbranch_result = repo.create_Branch(repo, at: commit, branch_name)
                
            case .failure(_):
                print("error")
            }
        case let .failure(error):
            print("\(error)")
        }
    }
}
