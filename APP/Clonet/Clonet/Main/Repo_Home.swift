//
//  Repo_Home.swift
//  Clonet
//
//  Created by 박지영 on 2022/01/15.
//

import SwiftUI
import MessageUI
import SwiftGit2
import SocketIO

//final class Service_SendInvite: ObservableObject {
//    private var manager = SocketManager(socketURL: URL(string: "ws://localhost:3000")!, config: [.log(true), .compress])
//
//    @Published var messages = [String]()
//    @Published var REemail = ""
//    @State var email: String = ""
//
//    func invite_button(email: String){
//        let socket = manager.defaultSocket
//        socket.connect()
//
//        socket.on(clientEvent: .connect){ (data, ack) in
//            self.REemail = email
//                       socket.emit("invite", self.REemail)
//
//                       sleep(2)
//                       socket.disconnect()
//        }
//
//        socket.on("invite"){ [weak self] (data, ack) in
//            if let data = data[0] as? [String: String],
//               let rawMessage = data["find_RESULT"] {
//                DispatchQueue.main.async {
//                    self?.messages.append(rawMessage)
//                    socket.disconnect()
//                }
//            }
//
//            socket.connect()
//        }
//
//    }
//}


let gitRepoURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

struct Repo_Home: View {
    
    @State private var selectionString: String? = nil
//    @ObservedObject var userAuth : UserAuth = UserAuth()
    @State private var showAlert = false
    
    @State var message = ""
    
    @State var lastCMuser : String = ""
    @State var lastCMmsg : String = ""
    @State var lastCMtime = Date()
    
    let localRepoLocation = gitRepoURL.appendingPathComponent("hye")
    let remoteRepoLocation = "http://3.36.89.105/git-repositories/hye.git"
    let test = "http://3.36.89.105/git-repositories/hye.git"
    
//    init() {
//        // git_libgit2_init()
//        Repository.initialize_libgit2()
//    }
    

    var repoName : String
    var user_id : String
    var branch : [String]

    init(repoName: String, user_id: String, branch: Array<String>) {
        Repository.initialize_libgit2()
        
        self.repoName = repoName
        self.user_id = user_id
        self.branch = branch
    }

    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("표시할 그림 선택 ")
                    Picker(selection: .constant(1), label: Text("Branch")) {
                        ForEach(0..<branch.count) {
                            Text(branch[$0])
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
        
                
                ZStack {
                    Button(action: {
                        self.selectionString = "branchButton"
                    }) {
                        HStack{
                            Image(systemName: "arrow.triangle.branch")
                            Text("브랜치")
                        }
                        
                        .frame(width: 300, height: 50)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 2)
                        )
                    }
                    .background(Color.black)
                    .cornerRadius(15)
                    
                    NavigationLink(destination: EmptyView(), tag: "branchButton", selection: $selectionString) { }
                    .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                }
                
                HStack {
                    ZStack {
                        Button(action: {
                            self.selectionString = "branchButton"
                        }) {
                            HStack{
                                Image(systemName: "arrowshape.turn.up.backward.fill")
                                Text("이전 상태로")
                            }
                            
                            .frame(width: 146, height: 50)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                        }
                        .background(Color.black)
                        .cornerRadius(15)
                        
                        NavigationLink(destination: EmptyView(), tag: "branchButton", selection: $selectionString) { }
                        .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                    }
                    ZStack {
                        Button(action: {
                            self.selectionString = "branchButton"
                        }) {
                            HStack{
                                Image(systemName: "list.bullet")
                                Text("로그확인")
                            }
                            
                            .frame(width: 146, height: 50)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                        }
                        .background(Color.black)
                        .cornerRadius(15)

                    }
                }
                ZStack {
                    Button(action: {
                        self.selectionString = "branchButton"
                    }) {
                        HStack{
                            Image(systemName: "square.and.arrow.down")
                            Text("다운로드")
                        }
                        
                        .frame(width: 300, height: 50)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 2)
                        )
                    }
                    .background(Color.black)
                    .cornerRadius(15)
                    
                }
                ZStack {
                    Button(action: {
                        self.selectionString = "branchButton"
                    }) {
                        Text("커밋하기")
                            .frame(width: 300, height: 50)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    .background(Color.green)
                    .cornerRadius(15)

                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                
                
                HStack{
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                    // 마지막 커밋한 유저, 브랜치, 날짜
                    VStack (alignment: .leading) {
                        HStack {
                            Text("Last Update by")
                            Text(lastCMuser)
                                .bold()
                                .font(.headline)
                        }
                        HStack {
                            Text(lastCMmsg)
                            Text("branch")
                                .bold()
                            Text(lastCMtime.dateFormat())
                        }
                    }
                }
                
                
            }
            .padding()
            
            //오른쪽
            VStack (alignment: .leading) {
                Image("Clonet_logo")
                    .resizable()
                .frame(width: 500, height: 500)
                .padding()
                
                HStack {
                    VStack (alignment: .leading){
                        HStack {
                            Text("Branch")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                            Text("21.09.20")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                        }
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                        Text("완성본")
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                    }
                    
                }
                
            }
            VStack{
                ZStack {
                    Button(action: {
                        self.selectionString = "branchButton"
                    }) {
                        Text("요청사항 보기")
                            .frame(width: 150, height: 50)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    .background(Color.black)
                    .cornerRadius(15)
                    
                    NavigationLink(destination: EmptyView(), tag: "branchButton", selection: $selectionString) { }
                    .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                }
                ZStack {
                    
                    Button(action: {
                        self.selectionString = "branchButton"
                    }) {
                        Text("전체 보기")
                            .frame(width: 150, height: 50)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    .background(Color.black)
                    .cornerRadius(15)
                    
                    NavigationLink(destination: EmptyView(), tag: "branchButton", selection: $selectionString) { }
                    .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                }
                
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                //사용자 추가하기
                Button(action: {
                    let alertHC = UIHostingController(rootView: AlertAddPerson())
                    
                    alertHC.preferredContentSize = CGSize(width: 300, height: 200)
                    alertHC.modalPresentationStyle = UIModalPresentationStyle.formSheet
                    
                    UIApplication.shared.windows[0].rootViewController?.present(alertHC, animated: true)}){
                        Image(systemName: "person.crop.circle.fill.badge.plus")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: 60, height: 50)
                        
                    }
                
                
                Spacer()
                ZStack {
                    Button(action: {
                        self.selectionString = "branchButton"
                    }) {
                        Text("Detail")
                            .frame(width: 100, height: 50)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    .background(Color.green)
                    .cornerRadius(15)
                    
                    NavigationLink(destination: EmptyView(), tag: "branchButton", selection: $selectionString) { }
                    .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                }
            }
            .padding(.vertical, 100.0)
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
                message = "Latest Commit: \(commit.message) by \(commit.author.name)"

            case let .failure(error):
                message = "Could not get commit: \(error)"
            }

        case let .failure(error):
            message = "Could not clone repository: \(error)"
        }
    }


    func loadGitRepo() {
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
                message = "Latest Commit: \(commit.message) by \(commit.author.name)"
                
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

extension Date {
        func dateFormat() -> String {
                let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("EEEE, MMM d")
            return dateFormatter.string(from: self)
        }
}

//사용자 추가시 이메일 보내는 alert
struct AlertAddPerson: View {
    @State private var email: String = ""
    @State private var group: String = "group1" // 임의로 넣은 값 수정해야함
//    @ObservedObject var service_SendInvite = Service_SendInvite()
    
    var body: some View {

        VStack {
//            let emailJSON = "{\"invite_user\": \"\()\", \"invite_email\": \"\(self.email)\", \"user_group\": \"\(self.group)\"}"
            let emailJSON = "{\"invite_email\": \"\(self.email)\", \"user_group\": \"\(self.group)\"}"
            Text("사용자 추가").font(.headline).padding()

            TextField("이메일을 입력해주세요", text: $email).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Divider()
            HStack {
                Spacer()
                Button(action: {
//                    service_SendInvite.invite_button(email: emailJSON)
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

struct Repo_Home_Previews: PreviewProvider {
    static var previews: some View {
        Repo_Home(repoName: "", user_id: "", branch: [])

    }
}
