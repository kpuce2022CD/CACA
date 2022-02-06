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
    
    var body: some View {
        
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
                    Text(i)
                }
            }.onAppear(perform: {
                print("list", dataList.items)
            })
        }
    }
}

struct Repo_View_Directory_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Directory()
    }
}
