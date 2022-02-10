////
////  Repo_View_Image.swift
////  Clonet
////
////  Created by Hye Min Choi on 2022/02/04.
////
//
//import SwiftUI
//
//struct Repo_View_Image: View {
//
//    @State var ImageName : String = "Clonet_logo"
//    @State var CommitTime : String = "21.09.20"
//    @State var CommitMessage : String = "Commit Message"
//    @State var location = "test"
//    @State var fileNameImg = "mumani.psd"
//
//    var documentsUrl: URL {
//        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//    }
//    var body: some View {
//        VStack{
//            // 선택한 이미지 상세 정보
//            VStack (alignment: .leading){
//                HStack {
//                    Text(ImageName)
//                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                        .bold()
//                    Text(CommitTime)
//                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                        .bold()
//                }
//                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
//                Text(CommitMessage)
//                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
//            }
//
//            // 선택한 이미지
//            Image(uiImage: load(fileName: fileNameImg)!)
//                .resizable()
//                .aspectRatio(contentMode: .fit) // Image 깨지지 않게 크기 처리
//                .frame(width: 500, height: 500)
//                .padding()
//        }
//    }
//    private func load(fileName: String) -> UIImage? {
//        let fileURL = documentsUrl.appendingPathComponent(location+"/"+fileName)
//        do {
//            let imageData = try Data(contentsOf: fileURL)
//            return UIImage(data: imageData)
//        } catch {
//            print("Error loading image : \(error)")
//        }
//        return nil
//    }
//}
//
//struct Repo_View_Image_Previews: PreviewProvider {
//    static var previews: some View {
//        Repo_View_Image()
//.previewInterfaceOrientation(.landscapeRight)
//    }
//}
