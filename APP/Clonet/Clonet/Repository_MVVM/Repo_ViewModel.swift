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
import ToastUI
import Combine

// MARK: log_repo_ViewModel
final class log_repo_ViewModel: ObservableObject{
    @Published var launches: Log_repo = Log_repo.init()
    @Published var launches_ip: Ip_repo = Ip_repo.init()
    @Published var launches_req: Request = Request.init()
    @Published var Log_repo_list : [Log_repo] = []
    @Published var Req_repo_list : [Request] = []
    @Published var repo_n: String = ""
    @Published var repoIP_Addr : String = ""
    
    @Published var URL1: String = ""
    @Published var URL2: String = ""
    @Published var diffSuccess: Bool = false
    
    
    init(){
        repoIP(Repo_Name: self.repo_n)
        Log_repo_list.removeAll()
        fetch(Repo_Name: repo_n)
        print("init : ", Log_repo_list)
        
        diffSuccess = false
    }
    
    func appear(){
        Log_repo_list.removeAll()
        fetch(Repo_Name: self.repo_n)
        repoIP(Repo_Name: self.repo_n)
    }
    
    //MARK: SelectRepoQuery
    func repoIP(Repo_Name: String){
        Network.shared.apollo.fetch(query: SelectRepoQuery(repo_name: Repo_Name)){ result in
            switch result {
            case .success(let graphQLResult):
                if let ip_repos = graphQLResult.data?.selectRepo {
                    for i in ip_repos.indices{
                        self.launches_ip = self.process_ip(data: ip_repos[i] ?? iprepoData.init(repoName: "", repoEc2Ip: ""))
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
    
    //MARK: LogRepoQuery
    func fetch(Repo_Name: String){
        Network.shared.apollo.fetch(query: LogRepoQuery(repo_name: Repo_Name), cachePolicy: CachePolicy.fetchIgnoringCacheData){ result in
            switch result {
            case .success(let graphQLResult):
                if let log_repos = graphQLResult.data?.logRepo {
                    for i in log_repos.indices{
                        self.launches = self.process(data: graphQLResult.data?.logRepo![i] ?? logrepoData.init(commitMsg: "", date: "", commitId: "", userId: ""))
                        self.Log_repo_list.append(self.launches)
                        print("Log_repo_list fetch", log_repos)
                    }
                } else if let errors = graphQLResult.errors {
                    print("GraphQL errors \(errors)")
                }
                
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    //MARK: Request List
    func Request_fetch(Repo_Name: String){
        self.Req_repo_list.removeAll()
        Network.shared.apollo.fetch(query: RequestRepoQuery(repo_name: Repo_Name), cachePolicy: CachePolicy.fetchIgnoringCacheData){ result in
            switch result {
            case .success(let graphQLResult):
                if let requestRepos = graphQLResult.data?.requestRepo {
                    for i in requestRepos.indices{
                        self.launches_req = self.process_req(data: graphQLResult.data?.requestRepo![i] ?? requestData.init(userId: "", repoName: "", xPixel: "", yPixel: "", requestContext: ""))
                        self.Req_repo_list.append(self.launches_req)
                    }
                    print("Req_repo_list fetch", self.Req_repo_list)
                } else if let errors = graphQLResult.errors {
                    print("GraphQL errors \(errors)")
                }
                
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    //MARK: CreateRequestMutation
    func CreateRequest(user_id: String, repo_name: String, x_pixel: String, y_pixel: String, request_context: String){
        Network.shared.apollo.perform(mutation: CreateRequestMutation(user_id: user_id, repo_name: repo_name, x_pixel: x_pixel, y_pixel: y_pixel, request_context: request_context)){ result in
            switch result{
            case .success(let graphQLResult):
                print("CreateRequestMutation Success")
            case .failure(let error):
                print("CreateRequestMutation failure")
            }
        }
    }
    
    func Diff(first_commit: String, second_commit: String, repo_name: String, file_name: String){
        Network.shared.apollo.fetch(query: DiffCommitQuery(first_commit: first_commit, second_commit: second_commit, repo_name: repo_name, file_name: file_name), cachePolicy: CachePolicy.fetchIgnoringCacheData){ result in
            switch result {
            case .success(let graphQLResult):
                print("DiffCommitQuery Success")
//                self.URL1 = "http://13.209.116.111/images/\(first_commit)_\(file_name)"
//                self.URL2 = "http://13.209.116.111/images/\(second_commit)_\(file_name)"
//                self.diffSuccess = true
 
            case .failure(_):
                print("DiffCommitQuery Failure")
            }
        }
    }
    
    
    func process(data: logrepoData) -> Log_repo {
        return Log_repo(data)
    }
    
    func process_ip(data: iprepoData) -> Ip_repo {
        return Ip_repo(data)
    }
    
    func process_req(data: requestData) -> Request {
        return Request(data)
    }
    
    
}


// MARK: AddUser Alert
struct AddUserAlert: View {
    @ObservedObject var loginCheck_ViewModel = LoginCheck_ViewModel()
    
    @State private var selectionString: String? = nil
    @State var showingAlert = true
    @State var input_userEmail = ""
    @State var input_userId = ""
    var uuserID = ""
    @State var repoName: String
    
    @State private var presentingToast_true: Bool = false
    @State private var presentingToast_false: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Text("사용자 추가하기").font(.headline).padding()
                
                TextField("초대 메시지를 보낼 이메일을 입력해주세요.", text: $input_userEmail).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                TextField("추가할 사용자의 아이디를 입력해주세요", text: $input_userId).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
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
                        
                        let htmlAttachment = Attachment(
                            htmlContent: """
                                                            <div class="m_-7513422647994330679main" style="margin:0;padding:0">
                            
                                                              <table class="m_-7513422647994330679wrapper"
                                                                style="border-collapse:collapse;table-layout:fixed;min-width:320px;width:100%;background-color:#131814"
                                                                cellpadding="0" cellspacing="0" role="presentation">
                                                                <tbody>
                                                                  <tr>
                                                                    <td>
                                                                      <div style="Margin-left:20px;Margin-right:20px">
                                                                        <div style="line-height:150px;font-size:1px">&nbsp;</div>
                                                                      </div>
                                                                      <div align="center">
                                                                        <img
                                                                          src="https://i1.createsend1.com/ei/y/5B/AD7/FD8/164801/csfinal/KakaoTalk_Photo_2022-01-15-14-39-19.png" height="200">
                                                                      </div>
                                                                    </td>
                                                                  </tr>
                                                                </tbody>
                                                              </table>
                                                            </div>
                            
                                                            </div>
                                                            <div>
                                                              <div
                                                                style="background-color:#131814;background:0px 0px/auto auto repeat url(https://ci4.googleusercontent.com/proxy/Xy2jV1jWTuQw1FY6zXOZtnaFbefQVZDdWiI-5wRe9_3pjvkBsto1uUMG_3RtDB4XJPOwH022-8Ylq__rcy83ncFeLHUcYVXHq-b3GrueZdXgVDmMOaNfhLN-pyrI=s0-d-e1-ft#http://i1.cmail20.com/ei/y/5B/AD7/FD8/164801/csfinal/image-beautiful-2.jpg) #131814;background-position:0px 0px;background-image:url(https://ci4.googleusercontent.com/proxy/Xy2jV1jWTuQw1FY6zXOZtnaFbefQVZDdWiI-5wRe9_3pjvkBsto1uUMG_3RtDB4XJPOwH022-8Ylq__rcy83ncFeLHUcYVXHq-b3GrueZdXgVDmMOaNfhLN-pyrI=s0-d-e1-ft#http://i1.cmail20.com/ei/y/5B/AD7/FD8/164801/csfinal/image-beautiful-2.jpg);background-repeat:repeat;background-size:auto auto">
                                                                <div class="m_-7513422647994330679layout m_-7513422647994330679one-col m_-7513422647994330679stack"
                                                                  style="Margin:0 auto;max-width:600px;min-width:320px;width:320px;width:calc(28000% - 167400px);word-wrap:break-word;word-break:break-word">
                                                                  <div class="m_-7513422647994330679layout__inner" style="border-collapse:collapse;display:table;width:100%">
                            
                                                                    <div class="m_-7513422647994330679column"
                                                                      style="text-align:left;color:#a6b0b3;font-size:14px;line-height:21px;font-family:Roboto,Tahoma,sans-serif">
                            
                                                                      <div style="Margin-left:20px;Margin-right:20px;Margin-top:12px">
                            
                                                                        <div style="line-height:28px;font-size:1px">&nbsp;</div>
                                                                      </div>
                            
                                                                      <div style="Margin-left:20px;Margin-right:20px">
                                                                        <div style="vertical-align:middle">
                                                                          <h2
                                                                            style="Margin-top:0;Margin-bottom:0;font-style:normal;font-weight:normal;color:#fff;font-size:22px;line-height:31px;font-family:Avenir,sans-serif;text-align:center">
                                                                            W E &nbsp; W E N T &nbsp; T O</h2>
                                                                          <h1
                                                                            style="Margin-top:16px;Margin-bottom:20px;font-style:normal;font-weight:normal;color:#fff;font-size:40px;line-height:47px;font-family:Avenir,sans-serif;text-align:center">
                                                                            Clonet</h1>
                                                                        </div>
                                                                      </div>
                            
                                                                      <div style="Margin-left:20px;Margin-right:20px">
                                                                        <div style="line-height:20px;font-size:1px">&nbsp;</div>
                                                                      </div>
                            
                                                                      <div style="Margin-left:20px;Margin-right:20px">
                                                                        <div class="m_-7513422647994330679btn" style="Margin-bottom:20px;text-align:center">
                                                                          <u></u><a
                                                                            style="border-radius:4px;display:inline-block;font-size:14px;font-weight:bold;line-height:24px;padding:12px 24px;text-align:center;text-decoration:none!important;color:#ffffff!important;border:1px solid #fff;font-family:Avenir,sans-serif"
                                                                            href="http://13.209.116.111:5312/?user_id=
                            """
                            + input_userId +
                            """
                            &&repo_name=
                            """
                            + repoName +
                            """
                            " target="_blank"
                                                                            data-saferedirecturl="https://www.google.com/url?q=https://kpu.cmail20.com/t/y-l-bzjilk-ihikujkidl-r/&amp;source=gmail&amp;ust=1642312571573000&amp;usg=AOvVaw310-sElFsJqD1fZ3lwkT9K">JOIN
                                                                            THE PROJECT</a><u></u>
                                                                        </div>
                                                                      </div>
                            
                                                                      <div style="Margin-left:20px;Margin-right:20px;Margin-bottom:12px">
                                                                        <div style="line-height:230px;font-size:1px">&nbsp;</div>
                                                                      </div>
                            
                                                                      <div style="Margin-left:20px;Margin-right:20px">
                                                                        <div style="line-height:150px;font-size:1px">&nbsp;</div>
                                                                      </div>
                            
                                                                    </div>
                            
                                                                  </div>
                                                                </div>
                                                              </div>
                            
                                                              <div style="line-height:30px;font-size:30px">&nbsp;</div>
                            
                                                            </div>
                            """
                        )
                        
                        let mail = Mail(
                            from: mail_from,
                            to: [mail_to],
                            subject: "Invite to CLONET",
                            attachments: [htmlAttachment]
                        )
                        
                        smtp.send(mail){ (error) in
                            if let error = error {
                                presentingToast_false = true
                                print(error)
                            }else{
                                presentingToast_true = true
                            }
                        }
                        
                        UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                        
                    }) {
                        Text("Invite")
                    }
                    //                    .toast(isPresented: $presentingToast_true, dismissAfter: 5.0){
                    //                        print("성공")
                    //                    } content: {
                    //                        ToastView("메일 전송 성공!")
                    //                            .toastViewStyle(IndefiniteProgressToastViewStyle())
                    //                    }
                    //                    .toast(isPresented: $presentingToast_false, dismissAfter: 5.0){
                    //                        print("성공")
                    //                    } content: {
                    //                        ToastView("메일 전송 실패")
                    //                            .toastViewStyle(IndefiniteProgressToastViewStyle())
                    //                    }
                    
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
                    .frame(height: 50)
            }.background(Color(white: 0.9))
        }
    }
}
