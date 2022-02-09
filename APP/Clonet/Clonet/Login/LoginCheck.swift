//
//  LoginCheck.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/10.
//

import SwiftUI
import Foundation
import SocketIO
import SwiftGit2

struct DynamicList: Identifiable { // 동적 리스트
    let id: UUID = UUID()
    let repoName: String
    let lastModify: String
}

class ListSample: ObservableObject{
    @Published var data: [DynamicList] = [
        DynamicList(repoName: "reposi1", lastModify: "22.01.15")
    ]
}

class UserRepo: ObservableObject {
    @Published var Repo_name = ""
    @Published var Repo_ec2_ip = "52.79.235.187"
    @Published var directory_path = ""
    
}

final class Service_createRepo: ObservableObject {
    private var manager = SocketManager(socketURL: URL(string: "ws://localhost:3000")!, config: [.log(true), .compress])

    @Published var messages = [String]()
    @Published var repo_List = [String]()
    @Published var RepoJSON = ""
    @State var json: String = ""
    
    func create_Repo(json: String){
        let socket = manager.defaultSocket
        
        socket.on(clientEvent: .connect){ (data, ack) in
            print("Connected")
            self.RepoJSON = json
            socket.emit("createRepo", self.RepoJSON)
        }
        
        
        socket.on("createRepo"){ [weak self] (data, ack) in
            
            if let data = data[0] as? [String: String],
               let rawMessage = data["repo_RESULT"] {
                DispatchQueue.main.async {
                    self?.messages.append(rawMessage)
                    print("rawMessage: ", String(rawMessage))
                    socket.disconnect()
                    
                }
            }
        }
        
        socket.on("repo_map_RESULT"){ [weak self] (data, ack) in
            
            socket.disconnect()
        }
        socket.connect()
    }
    
    func read_Repo(json: String){
        let socket = manager.defaultSocket
        
        socket.on(clientEvent: .connect){ (data, ack) in
            print("Connected")
            self.RepoJSON = json
            socket.emit("readRepo", self.RepoJSON)
        }
        
        
        socket.on("readRepo"){ [weak self] (data, ack) in
            
            if let data = data[0] as? [String: String],
               let rawMessage = data["readRepo_RESULT"] {
                DispatchQueue.main.async {
                    self?.repo_List.append(rawMessage)
                    print("rawMessage: ", String(rawMessage))
                    socket.disconnect()
                    
                }
            }
        }
        
        socket.connect()
    }
}
// repoName 요청
final class Service_repoName: ObservableObject {
    private var manager = SocketManager(socketURL: URL(string: "ws://localhost:3000")!, config: [.log(true), .compress])
    
    @Published var result = [String]()
    @Published var str2 = [String]() // list
    @Published var REemail = ""
    @State var json: String = ""
    
    
    func repoNameQ(json: String){
        let socket = manager.defaultSocket
        socket.connect()
        socket.on(clientEvent: .connect){ (data, ack) in
            print(json)
            self.REemail = json
            socket.emit("userRepo", self.REemail)
        }
        
        socket.on("userRepo"){ [weak self] (data, ack) in
            if let data = data[0] as? [String: String],
               let rawMessage = data["repoName_result"] {
                DispatchQueue.main.async { [self] in
                    self?.result.append(rawMessage)
                    print("rawMessage: ", String(rawMessage))
                    
                    print("aaa", self!.result)
                    socket.disconnect()
                    
                    var str = rawMessage
                    
                    let replacements = [
                        ("repo_name", ""),
                        ("[",""),
                        ("]",""),
                        ("{\"\":\"",""),
                        ("\"}","")
                    ]
                    
                    for (search, replacement) in replacements{
                        str = str.replacingOccurrences(of: search, with: replacement)
                    }
                    self?.str2 = str.components(separatedBy: ",")
                    let _ = self?.return_remoteBranch_(userID: json)
                }
                
            }
            
            socket.connect()
        }
        
    }
    
    ///////////// branch 정보 가져오기
//    @State var message_branch = "aaa"
    @State var branchArr : [String] = []
    @State var resultBranchDic : [String] = []
    @Published var branchArrList = [[String]]()
    @State var userID : String = ""
    @State var repoArr = [String]()
    
    
    
    init(){
        Repository.initialize_libgit2()
    }
    
    
    func return_remoteBranch_(userID : String) -> [[String]]{
//        let _ = GetRepoName.repoNameQ(json: userID)
        var message_branch = ""
        print("GetRepoName:", str2.count)
        for i in 0..<str2.count {
            var localRepoLocation = documentURL.appendingPathComponent(str2[i])
            print("userIDIDIDID", str2[i])
            var resultBranch : [Branch] = []
            let result = Repository.at(localRepoLocation)
            print("userAT:", result)
            switch result {
            case let .success(repo):
                let remoteBranch_result = repo.remoteBranches()
                switch remoteBranch_result{
                case let .success(branch):
                    message_branch = "\(branch)"
                    print("useraaa:", branch)
                    resultBranch = branch
                case let .failure(branch):
//                    message_branch = "\(branch)"
                    print("fail")
                }
                
            case let .failure(error):
//                message_branch = "Could not open repository: \(error)"
                print("fail")
            }
            
            branchArr = []
            print("message_branch: ", resultBranch)
            for i in 0..<resultBranch.count {
                
                var index = resultBranch.index(resultBranch.startIndex, offsetBy:i)
                
                var s = "\(resultBranch[index])"
                var branchName = s.split(separator: "\"")
                
                self.branchArr.append(String(branchName[3]))
//                print("message22:", branchArr)
            }
            print("aaaa1:", branchArr)
            branchArrList.append(branchArr)
        }
        print("branchArrList", branchArrList)
        return branchArrList
    }
}


struct LoginCheck: View {
    @State var id = ""
    @State private var showAlert = false
//    @ObservedObject var userAuth : UserAuth = UserAuth()
    @ObservedObject var userRepo : UserRepo = UserRepo()
    @ObservedObject var service = Service_createRepo()

    @ObservedObject var GetRepoName = Service_repoName()
    
    var result_BranchList = [[String]]()
    var repoArr = [String]()
    
    init(userID: String){
        self.userID = userID
        Repository.initialize_libgit2()
        let _ = GetRepoName.repoNameQ(json: userID)
//        result_BranchList = serviceBranch.return_remoteBranch_(userID: userID, repoArr:repoArr)
//        branchArrList = GetRepoName.return_remoteBranch_(userID: userID)
        print("result_branch:", branchArrList)
    }
    
    @State var branchArr : [String] = []
//    @State var resultBranchDic : [String] = []
    @State var branchArrList = [[String]]()
    var repoName = ""
    
    var ProfileImgName: String = "user1"
    var nickName: String = ""
    var userID : String = ""
    

    
    var body: some View {
        
        NavigationView{
            HStack{
                VStack{
                    Spacer()
                    UserMainImage
                        .padding()
                    UserInfo
                    Spacer()
                }
                VStack{
                    HStack{
                        Spacer()
                        Button(action: {
//                            let alertHC = UIHostingController(rootView: MyAlert(userAuth:userAuth))
//
//                            alertHC.preferredContentSize = CGSize(width: 300, height: 200)
//                            alertHC.modalPresentationStyle = UIModalPresentationStyle.formSheet
//
//                            UIApplication.shared.windows[0].rootViewController?.present(alertHC, animated: true)
                            
                            
                        }) {
                            Text("추가")
                            
                            
                        }
                        .padding()
                    }
                    List{
                        ForEach(GetRepoName.str2, id: \.self) { i in
                           
                            NavigationLink(destination: Repo_Home(repoName: i, user_id: userID, branch: branchArr)){
                                VStack{
                                    Text(i).padding()
                                        .padding(2)
                                        .font(.title3)
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .onAppear {
                        }
                    }
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .hiddenNavigationBarStyle()
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MyAlert: View {
//    @State private var text: String = ""
//    @ObservedObject var userAuth : UserAuth = UserAuth()
    @ObservedObject var service = Service_createRepo()
    @ObservedObject var userRepo : UserRepo = UserRepo()
    @State private var selectionString: String? = nil
    @State var showingAlert = true
    
    
    var body: some View {
//        let RepoJSON = "{\"user_id\": \"\(userAuth.user_id)\", \"repo_name\": \"\(userRepo.Repo_name)\", \"Repo_ec2_ip\": \"\(userRepo.Repo_ec2_ip)\", \"directory_path\": \"\(userRepo.directory_path)\"}"
        VStack {
            Text("저장소 이름").font(.headline).padding()
            
            TextField("내용을 입력해주세요", text: $userRepo.Repo_name).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Divider()
            HStack {
                Spacer()
//                Button(action: {
//                    UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
//
//                    service.create_Repo(json: RepoJSON)
//
//                }) {
//
//                    Text("완료")
//                }
                ZStack {
//                    NavigationLink(destination: LoginCheck(userAuth: userAuth), tag: "RepoButton", selection: $selectionString) { }
//                    .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                    Button("완료") {
                        UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                        self.selectionString = "RepoButton"
//                        service.create_Repo(json: RepoJSON)
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

func addRepo(){
    //    print("button clicked")
    //    let newLIst = DynamicList(repoName: text)
    //    ListSample.
    //
}


private extension LoginCheck{
    var UserMainImage: some View{
        CircleImage(image: Image(ProfileImgName))
            .offset(y: -130)
            .padding(.bottom, -130)
    }
    
    var UserInfo: some View {
        VStack(alignment: .center){
            Text(nickName)
                .font(.title)
//            Text(userAuth.user_id)
//                .font(.body)
        }
        .padding()
        
    }
}

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

struct LoginCheck_Previews: PreviewProvider {
    static var previews: some View {
        LoginCheck(userID: "")
.previewInterfaceOrientation(.landscapeLeft)
    }
}
