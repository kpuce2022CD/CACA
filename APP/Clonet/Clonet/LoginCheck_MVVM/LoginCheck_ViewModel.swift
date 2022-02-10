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
    var image :Image
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
        //        let RepoJSON = "{\"user_id\": \"\(userAuth.user_id)\", \"repo_name\": \"\(userRepo.Repo_name)\", \"Repo_ec2_ip\": \"\(userRepo.Repo_ec2_ip)\", \"directory_path\": \"\(userRepo.directory_path)\"}"
        VStack {
            VStack {
                Text("저장소 이름").font(.headline).padding()
                
                TextField("내용을 입력해주세요 \(uuserID)", text: $input_repoName).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                Divider()
                HStack {
                    Spacer()
                    //                    Button(action: {
                    //                        UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                    //
                    //                        service.create_Repo(json: RepoJSON)
                    //
                    //                    }) {
                    //
                    //                        Text("완료")
                    //                    }
                    ZStack {
                        //                                        NavigationLink(destination: LoginCheck_View(userAuth: userAuth), tag: "RepoButton", selection: $selectionString) { }
                        //                                        .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                        Button("완료") {
                            UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                            self.selectionString = "RepoButton"
                            loginCheck_ViewModel.create_repo(repoName: input_repoName, user_id: uuserID)
                            //                            service.create_Repo(json: RepoJSON)
                        }
                    }
                    
                    Spacer()
                    
                    Divider()
                    
                    Spacer()
                    Button(action: {
                        UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                    }) {
                        Text("취소")
                    }
                    Spacer()
                }.padding(0)
                
            }.background(Color(white: 0.9))
        }
    }
}


final class LoginCheck_ViewModel: ObservableObject {
    @Published var launches: RepoNameList = RepoNameList.init()
    @Published var Repo_List: [RepoNameList] = []
    
    @ObservedObject var login_ViewModel = Login_ViewModel()
    @Published var repoName = ""
    @Published var user_id = ""
    
    init(){
        fetch(user_id: user_id)
        create_repo(repoName: repoName, user_id: user_id)
    }
    
    func create_repo(repoName: String, user_id: String){
        print("create_repo: \(repoName), \(user_id)")
        if(repoName != ""){
            Network.shared.apollo.perform(mutation: CreateRepoMutation(repo_name: repoName, repo_ec2_ip: "ec2_ip", user_id: user_id)){ result in
                switch result{
                case .success(let graphQLResult):
                    print("create_repo S :\(graphQLResult.data?.createRepo)")
                case .failure(let error):
                    print("create_repo F \(error)")
                }
            }
        }else {
            print("create_repo F: empty reponame")
        }
    }
    
    func fetch(user_id: String){
        Network.shared.apollo.fetch(query: RepoListQuery(user_id: user_id)){ result in
            switch result {
            case .success(let graphQLResult):
                if let log_repos = graphQLResult.data?.repoList {
                    for i in log_repos.indices{
                        self.launches = self.process(data: graphQLResult.data?.repoList![i] ?? RepoListData.init(userId: "" , repoName:""))
                        self.Repo_List.append(self.launches)
                        print("\(self.Repo_List)")
                    }
                } else if let errors = graphQLResult.errors {
                    print("GraphQL errors \(errors)")
                }
                
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    func process(data: RepoListData) -> RepoNameList {
        print("\(RepoNameList(data))")
        return RepoNameList(data)
    }
    
    func loginCheck_alert(userID : String){
        print("create_repo USerID:\(userID)")
        let alertHC = UIHostingController(rootView: MyAlert(uuserID: userID))//userAuth:userAuth))
        
        alertHC.preferredContentSize = CGSize(width: 300, height: 200)
        alertHC.modalPresentationStyle = UIModalPresentationStyle.formSheet
        
        UIApplication.shared.windows[0].rootViewController?.present(alertHC, animated: true)
    }
    
    // MARK: ProfileImage
    var ProfileImgName: String = ""
//    var nickName: String = ""
//    var userID : String = ""
    
    var UserMainImage: some View{
        CircleImage(image: Image(ProfileImgName))
            .offset(y: -130)
            .padding(.bottom, -130)
    }
    
    var UserInfo: some View {
        VStack(alignment: .center){
            Text(user_id)
                .font(.title)
//            Text(user_id)
//                .font(.body)
        }
        .padding()
        
    }
}
