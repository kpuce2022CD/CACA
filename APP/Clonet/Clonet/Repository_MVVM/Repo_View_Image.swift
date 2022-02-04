//
//  Repo_View_Image.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI

struct Repo_View_Image: View {
    
    @State var ImageName : String = "Clonet_logo"
    @State var CommitTime : String = "21.09.20"
    @State var CommitMessage : String = "Commit Message"

    var body: some View {
        VStack{
            // 선택한 이미지 상세 정보
            VStack (alignment: .leading){
                HStack {
                    Text(ImageName)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    Text(CommitTime)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                }
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                Text(CommitMessage)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
            }
            
            // 선택한 이미지
            Image(ImageName)
                .resizable()
                .aspectRatio(contentMode: .fit) // Image 깨지지 않게 크기 처리
                .frame(width: 500, height: 500)
                .padding()
        }
    }
}

struct Repo_View_Image_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Image()
.previewInterfaceOrientation(.landscapeRight)
    }
}
