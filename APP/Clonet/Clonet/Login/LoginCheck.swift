//
//  LoginCheck.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/10.
//

import SwiftUI
import Foundation

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

struct LoginCheck: View {
    @State var id = ""
    @State private var showAlert = false
    
    var ProfileImgName: String = "user1"
    var nickName: String = "유저원"
    var userID : String = "user1@gmail.com"
    var lastMsg: String = "연유커피한잔 .. ^^"
    
    struct DynamicList: Identifiable { // 동적 리스트
        let id: UUID = UUID()
        let repoName: String
        let lastModify: String
    }
    
    let ListSample: [DynamicList] = [ // 리스트
        DynamicList(repoName: "reposi1", lastModify: "22.01.15")
    ]
    
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
                            let alertHC = UIHostingController(rootView: MyAlert())
                            
                            alertHC.preferredContentSize = CGSize(width: 300, height: 200)
                            alertHC.modalPresentationStyle = UIModalPresentationStyle.formSheet
                            
                            UIApplication.shared.windows[0].rootViewController?.present(alertHC, animated: true)
                            
                            
                        }) {
                            Text("추가")
                            
                            
                        }
                        .padding()
                    }
                    List{
                        ForEach(ListSample, id: \.repoName){ i in
                            VStack{
                                Text(i.repoName)
                                    .padding(2)
                                    .font(.title3)
                                Text(i.lastModify)
                                    .font(.body)
                            }
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
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text("저장소 이름").font(.headline).padding()
            
            TextField("내용을 입력해주세요", text: $text).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Divider()
            HStack {
                Spacer()
                Button(action: {
                    UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                    
                    
                    addRepo()
                }) {
                    
                    Text("완료")
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
            Text(userID)
                .font(.body)
            HStack(alignment: .center) {
                Spacer()
                Text(lastMsg)
                    .font(.subheadline)
                Spacer()
            }
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
        LoginCheck()
    }
}
