//
//  Repo_ViewModel.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import Foundation
import Apollo
import SwiftUI
import SwiftSMTP

final class log_repo_ViewModel: ObservableObject{
    @Published var launches: Log_repo = Log_repo.init()
    @Published var launches_ip: Ip_repo = Ip_repo.init()
    @Published var Log_repo_list : [Log_repo] = []
    @Published var repo_n: String = ""
    @Published var repoIP_Addr : String = ""
    
    func appear(){
        fetch(Repo_Name: self.repo_n)
        repoIP(Repo_Name: self.repo_n)
    }

    
    func repoIP(Repo_Name: String){
        Network.shared.apollo.fetch(query: SelectRepoQuery(repo_name: Repo_Name)){ result in
            switch result {
            case .success(let graphQLResult):
                if let ip_repos = graphQLResult.data?.selectRepo {
                    for i in ip_repos.indices{
                        self.launches_ip = self.process_ip(data: ip_repos[i] ?? iprepoData.init(repoName: "", repoEc2Ip: ""))
//                        print("launces_ip:", self.launches_ip.repo_ec2_ip)
//                        self.repoIP_Addr = self.launches_ip.repo_ec2_ip
                        self.repoIP_Addr = "http://" + self.launches_ip.repo_ec2_ip + "/git-repositories/" + self.repo_n + ".git"
                        print("launces_ip:", self.repoIP_Addr)
                    }
                } else if let errors = graphQLResult.errors {
                    print("GraphQL errors \(errors)")
                }
                
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    func fetch(Repo_Name: String){
        Network.shared.apollo.fetch(query: LogRepoQuery(repo_name: Repo_Name)){ result in
            switch result {
            case .success(let graphQLResult):
                if let log_repos = graphQLResult.data?.logRepo {
                    for i in log_repos.indices{
                        self.launches = self.process(data: graphQLResult.data?.logRepo![i] ?? logrepoData.init(commitMsg: "", date: "", commitId: "", userId: ""))
                        self.Log_repo_list.append(self.launches)
                        print("Log_repo_list", log_repos)
                    }
                } else if let errors = graphQLResult.errors {
                    print("GraphQL errors \(errors)")
                }
                
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    
    func process(data: logrepoData) -> Log_repo {
        return Log_repo(data)
    }
    
    func process_ip(data: iprepoData) -> Ip_repo {
        return Ip_repo(data)
    }
    
    
    func loginCheck_alert(userID : String){
        let alert = UIHostingController(rootView: AddUserAlert(uuserID: userID))
        
        alert.preferredContentSize = CGSize(width: 300, height: 200)
        alert.modalPresentationStyle = UIModalPresentationStyle.formSheet
        
        UIApplication.shared.windows[0].rootViewController?.present(alert, animated: true)
    }
}

struct AddUserAlert: View {
    @ObservedObject var loginCheck_ViewModel = LoginCheck_ViewModel()
    
    @State private var selectionString: String? = nil
    @State var showingAlert = true
    @State var input_userEmail = ""
    var uuserID = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("사용자 추가하기").font(.headline).padding()
                
                TextField("추가할 사용자의 이메일을 입력해주세요.", text: $input_userEmail).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                Divider()
                
                
                HStack {
                    Spacer()
                    Button(action: {
                        
                        // Send Email
                        let smtp = SMTP(
                            hostname: "smtp.gmail.com",
                            email: "clonet.caca@gmail.com",
                            password: "qweR1234@"
                        )
                        
                        let NewUser = input_userEmail.components(separatedBy: "@")
                        
                        let mail_from = Mail.User(name: "clonet.caca", email: "clonet.caca@gmail.com")
                        let mail_to = Mail.User(name: NewUser[0], email: input_userEmail)
                        
                        let mail = Mail(
                            from: mail_from,
                            to: [mail_to],
                            subject: "Invite to CLONET",
                            text: "WELCOME"
                        )
                        
                        smtp.send(mail){ (error) in
                            if let error = error {
                                print(error)
                            }
                        }
                        
                        UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                        
                    }) {
                        Text("Invite")
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
    }
}
