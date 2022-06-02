//
//  LoginCheck_ViewModel.swift
//  Clonet
//
//  Created by Jimin on 2022/02/09.
//

import Foundation
import Apollo
import SwiftUI

struct CircleImage: View{
    var image : Image
    var imgHW : CGFloat = 150
    
    var body: some View{
        image
            .resizable()
            .frame(width: imgHW, height: imgHW)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white,lineWidth: 3))
            .shadow(radius: 5)
    }
}

struct MyAlert: View {
    //    @ObservedObject var userAuth : UserAuth = UserAuth()
    @ObservedObject var loginCheck_ViewModel = LoginCheck_ViewModel()
    
    @State private var selectionString: String? = nil
    @State var showingAlert = true
    @State var input_repoName = ""
    var uuserID = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("저장소 이름").font(.headline).padding()
                
                TextField("내용을 입력해주세요.", text: $input_repoName).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                Divider()
                HStack {
                    Spacer()
                    ZStack {
                        Button("완료") {
                            UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                            self.selectionString = "RepoButton"
                            loginCheck_ViewModel.create_repo(repoName: input_repoName, user_id: uuserID)
                            loginCheck_ViewModel.fetch(user_id: uuserID)
                        }
                    }
                    
                    Spacer()
                    
                    Divider()
                    
                    Spacer()
                    Button(action: {
                        UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                        loginCheck_ViewModel.fetch(user_id: uuserID)
                    }) {
                        Text("취소")
                    }
                    Spacer()
                }.padding(0)
                
            }.background(Color(white: 0.9))
            
        }
    }
}


// MARK: LoginCheck_ViewModel
final class LoginCheck_ViewModel: ObservableObject {
    @Published var launches: RepoNameList = RepoNameList.init()
    @Published var Repo_List: [RepoNameList] = []
    
    @ObservedObject var login_ViewModel = Login_ViewModel()
    @Published var repoIP = "13.209.116.111"
    @Published var repoName = ""
    @Published var user_id = ""
    var timer: Timer?
    
    init(){
        fetch(user_id: user_id)
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    func first(user_id: String){
        self.user_id = user_id
        fetch(user_id: user_id)
        
        // Timer to get Data
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.fetch(user_id: user_id)
        })
        
    }
    
    // MARK: CREATE REPO
    func create_repo(repoName: String, user_id: String){
        if(repoName != ""){
            Network.shared.apollo.perform(mutation: CreateRepoMutation(repo_name: repoName, repo_ec2_ip: repoIP, user_id: user_id)){ result in
                switch result{
                case .success(let graphQLResult):
                    print("create_repo Success :\(graphQLResult.data?.createRepo)")
                case .failure(let error):
                    print("create_repo Failed \(error)")
                }
            }
        }else {
            print("create_repo Failed: empty reponame")
        }
    }
    
    // MARK: GET REPO LIST
    func fetch(user_id: String){
        Network.shared.apollo.fetch(query: RepoListQuery(user_id: user_id), cachePolicy: CachePolicy.fetchIgnoringCacheData){ result in
            switch result {
            case .success(let graphQLResult):
                self.Repo_List = []
                if let log_repos = graphQLResult.data?.repoList {
                    for i in log_repos.indices{
                        
                        self.launches = self.process(data: graphQLResult.data?.repoList![i] ?? RepoListData.init(userId: "" , repoName:""))
                        self.Repo_List.append(self.launches)
                        
                    }
                    print("fetch:\(self.Repo_List)")
                } else if let errors = graphQLResult.errors {
                    print("GraphQL errors \(errors)")
                }
                
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
        
    }
    
    func process(data: RepoListData) -> RepoNameList {
        return RepoNameList(data)
    }
    
    func loginCheck_alert(userID : String){
        let alertHC = UIHostingController(rootView: MyAlert(uuserID: userID))//userAuth:userAuth))
        
        alertHC.preferredContentSize = CGSize(width: 300, height: 200)
        alertHC.modalPresentationStyle = UIModalPresentationStyle.formSheet
        
        UIApplication.shared.windows[0].rootViewController?.present(alertHC, animated: true)
        
        fetch(user_id: userID)
    }
    
}
