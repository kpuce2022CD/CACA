//
//  Repo_View_Request.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI

struct Repo_View_Request: View {
    @StateObject var userViewModel = log_repo_ViewModel()
    @State var RequestName = ["RequestName1", "RequestName2", "RequestName3"]
    @State var RequestText = ["RequestText1", "RequestText2", "RequestText3"]
    
    var body: some View {

        // Request 목록 불러오기
        ScrollView(){
            ForEach(0..<RequestName.count){listCount in
                HStack(){
                    Image(systemName: "person.circle.fill")
                    Text(RequestName[listCount])
                    Text(" : ")
                    Text(RequestText[listCount])
                }
                .padding(.bottom, 2.0)
                .frame(maxWidth: .infinity)
            }
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
        }
        .padding()
    }
}

struct Repo_View_Request_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Request()
    }
}
