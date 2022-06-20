//
//  Repo_View.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI
import ToastUI

struct Repo_View: View {
    var userID: String = ""
    var repoName: String = ""
    var userIP: String = ""
    @State private var presentingToast_back: Bool = false
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var branchName = BranchName()
//    var backButton : some View {
//        Button(action: {
//            // MARK: 절대 지우면 안됨 (Back 경고창 띄우기)
////            presentingToast_back = true
//            self.presentationMode.wrappedValue.dismiss()
//        }){
//            HStack{
//                Text("Back")
//            }
//        }
//        // MARK: 절대 지우면 안됨 (Back 경고창 띄우기)
////        .alert(isPresented: $presentingToast_back) {
////            Alert(title: Text("Back"), message: Text("나가게 되면 작업 내용을 모두 잃게 됩니다. 나가시겠습니까?"), primaryButton: .destructive(Text("확인"), action: {
////                self.presentationMode.wrappedValue.dismiss()
////            }), secondaryButton: .cancel(Text("취소")))
////        }
//
//
//
//    }

    init(userID: String, repoName: String, userIP: String) {
        self.userID = userID
        self.repoName = repoName
        self.userIP = userIP
    }

    var body: some View {
        HStack {

            VStack {
                Repo_View_Directory(repo_n: repoName, ec2_id: userIP, user_id: userID)
            }
            VStack {
                // MARK: BranchName
                VStack {
                    Text("브랜치 : \(branchName.currentBranchName)")
                        .font(.system(size: 30, weight: .bold))
                }
                Repo_View_Request(repoName: repoName)
                //                Repo_View_Log(repo_n: repoName)
                Repo_View_Git(repo_n: repoName, userID: userID, branchName: branchName, userIP: userIP)
            }
        }
    }
}

struct Repo_View_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View(userID: "", repoName: "", userIP: "")
    }
}
