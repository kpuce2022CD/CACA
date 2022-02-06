//
//  Repo_View_Directory.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI
import MobileCoreServices

final class getFileList: ObservableObject{
    @State var repoName_test = "test"
    @Published var items = [String]()
    init(){
        location(repoName: self.repoName_test)
    }
    // MARK: GET FILE LIST
    func location(repoName: String){
        print("reponame: \(repoName)")
        
        let urlString = documentURL.appendingPathComponent(repoName).absoluteString
        let fileManager = FileManager.default
        var remoteString = urlString.replacingOccurrences(of: "file://", with: "")
        do{
            items = try fileManager.contentsOfDirectory(atPath: remoteString)
            print(items)
        }catch{
            print("error")
        }
    }
}

struct DocumentPicker : UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return DocumentPicker.Coordinator(parent1: self)
    }
    
    @Binding var alert : Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPicker>) ->
    UIDocumentPickerViewController{
        let picker = UIDocumentPickerViewController(documentTypes: [String(kUTTypeItem)], in: .import)
        picker.allowsMultipleSelection = false
        picker.delegate = context.coordinator
        return picker
    }
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPicker>){

    }
    
    class Coordinator : NSObject,UIDocumentPickerDelegate{
        var parent : DocumentPicker
        init(parent1: DocumentPicker){
            parent = parent1
        }
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            print(urls)
            // code
        }
    }
}

struct Repo_View_Directory: View {
    @ObservedObject var dataList = getFileList()
    @State var show = false
    @State var alert = false
    
    //Repo_View_Image
    @State var ImageName : String = "Clonet_logo"
    @State var CommitTime : String = "21.09.20"
    @State var CommitMessage : String = "Commit Message"
    @State var location = "test"
    @State var fileNameImg = "mumani.psd"

    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    //////////////
    
    var body: some View {
        HStack{
            
            VStack{
                Button(action:{
                    self.show.toggle()
                }){
                    Text("Document Picker")
                }
                .sheet(isPresented: $show){
                    DocumentPicker(alert: self.$alert)
                }
                .alert(isPresented: $alert) {
                    Alert(title: Text("Message"), message: Text("Upload Successfully"), dismissButton: .default(Text("OK")))
                }
                List{
                    
                    ForEach(dataList.items, id: \.self){ i in
//                        Text(i)
                        Button(i, action: {fileNameImg = i})
                    }
                }.frame(width: 300)
            }
            
            
            //Repo_View_Image
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
                Image(uiImage: load(fileName: fileNameImg)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit) // Image 깨지지 않게 크기 처리
                    .frame(width: 500, height: 500)
                    .padding()
            }
        }
    }
    
    private func load(fileName: String) -> UIImage? {
        let fileURL = documentsUrl.appendingPathComponent(location+"/"+fileName)
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        }
        return nil
    }
    
    
    
}


struct Repo_View_Directory_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Directory()
    }
}
