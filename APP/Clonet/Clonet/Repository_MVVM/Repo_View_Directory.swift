//
//  Repo_View_Directory.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI
import MobileCoreServices
import Foundation
import ToastUI

final class getFileList: ObservableObject{
    @State var repoName = ""
    @Published var items = [String]()
    @Published var text : String = ""
    @State var saveCheck : Bool = true
    
    init(){
        text = readMELoad(fileName: "README.md")
    }
    
    func first(repo_n: String){
//        self.repoName = repo_n
        location(repoName: repo_n)
    }
    
    // MARK: GET FILE LIST
    func location(repoName: String){
        print("reponame: \(repoName)")
        
        let urlString = documentURL.appendingPathComponent(repoName).absoluteString
        let fileManager = FileManager.default
        var remoteString = urlString.replacingOccurrences(of: "file://", with: "")
        do{
            items = try fileManager.contentsOfDirectory(atPath: remoteString)
            print("items : \(items)")
        }catch{
            print("error")
        }
    }
    
    // MARK: READ STRING FILE
    func readMELoad(fileName: String) -> String {
        var result = ""
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(repoName+"/"+fileName)
            
            do {
                result = try String(contentsOf: fileURL, encoding: .utf8)
                return result
            }
            catch {print("fail to load readme")}
        }
        return result
    }
    
    // MARK: SAVE STRING FILE
    // MARK: 이 함수 README.md 말고 다른 파일도 저장할 수 있도록 바꿔주세요
    func readMEsave(text: String){
        var fileName : String = "README.md"
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(repoName+"/"+fileName)
            do {
                try text.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                print("save success")
                saveCheck = true
                print("self.saveCheck \(saveCheck) : getFileList")
            } catch {
                print("save fail")
                saveCheck = false
            }
        }
    }
}

// MARK: DocumentPicker Struct
struct DocumentPicker : UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return DocumentPicker.Coordinator(parent1: self, repo_name: repo_name, img_name: img_name)
    }
    
    @Binding var alert : Bool
    @Binding var repo_name: String
    @Binding var img_name: String
    
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
        var repo_name: String
        var img_name: String

        
        init(parent1: DocumentPicker, repo_name: String, img_name: String){
            parent = parent1
            self.repo_name = repo_name
            self.img_name = img_name
        }
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            print("ursl \(urls)")
            guard let selectedFileURL = urls.first else {
                return
            }
            // add File
            let fileManager = FileManager.default
            let directoryURL = documentURL.appendingPathComponent("\(self.repo_name)/\(selectedFileURL.lastPathComponent)")
            do{
                try fileManager.copyItem(at: urls.first!, to: directoryURL)
            }catch let e {
                print("fileManager Error")
            }
        }
    }
}

// MARK: Repo_View_Directory: View
struct Repo_View_Directory: View {
    
    @State var repo_n : String
    @State var ec2_id : String
    
    
    @ObservedObject var dataList = getFileList()
    @State var show = false
    @State var alert = false
    
    //Repo_View_Image
    @State var fileNameImg = "" // to Store File Name picked
    @State private var editREADME : Bool = true // determine README or not
    @State var saveCheck : Bool = false
    
    
    
    init(repo_n: String, ec2_id: String){
        self.repo_n = repo_n
        self.ec2_id = ec2_id
        dataList.first(repo_n: self.repo_n)
    }
    
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
//    func delteFile(at offsets: IndexSet){
//        print("offsets \(offsets)")
//        let fileManager = FileManager.default
////        let directoryURL = documentURL.appendingPathComponent("\(self.repo_n)/" + "\(        dataList.items.index(<#T##i: Int##Int#>, offsetBy: <#T##Int#>))")
////        print("offsets: \(offsets)")
////        do{
////            try fileManager.removeItem(at: directoryURL)
////        }catch let e {
////            print("\(e)")
////        }
//    }
    
    var body: some View {
        HStack{
            
            VStack{
                // MARK: Document Picker Button (To add)
                Button(action:{
                    self.show.toggle()
                }){
                    Text("Document Picker")
                }
                .sheet(isPresented: $show){
                    DocumentPicker(alert: self.$alert, repo_name: self.$repo_n, img_name: self.$fileNameImg)
                }
                .alert(isPresented: $alert) {
                    Alert(title: Text("Message"), message: Text("Upload Successfully"), dismissButton: .default(Text("OK")))
                }
                // MARK: Show File List
                List{
                    ForEach(dataList.items, id: \.self){ i in
                        if(i != ".git"){
                            Button(i, action: {
                                fileNameImg = i
                                if(i == "README.md"){
                                    editREADME = true
                                } else{
                                    editREADME = false
                                }
                            })
                        }
                    }
//                    .onDelete(perform: )
//                    .onDelete(perform: dataList. delteFile)
                }.frame(width: 300)
            }
            
            
            //MARK: Repo_View_Image
            VStack{
                if editREADME {
                    VStack{
                        TextEditor(text: $dataList.text)
                            .padding()
                            .foregroundColor(Color.black)
                            .lineSpacing(5) //줄 간격
                        
                            .frame(width: 500, height: 500)
                            .border(Color.yellow, width: 1)
                        Button("Save", action: {
                            dataList.readMEsave(text: dataList.text)
                            self.saveCheck = dataList.saveCheck
                            print("self.saveCheck \(saveCheck) : Repo_View")
                        })
                            .toast(isPresented: $saveCheck, dismissAfter: 0.5) {
                                print("SAVE SUCCESS")
                            } content: {
                                ToastView("SAVE SUCCESS")
                            }
                    }
                    
                } else {
                    Image(uiImage: load(fileName: fileNameImg)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit) // Image 깨지지 않게 크기 처리
                        .frame(width: 500, height: 500)
                        .padding()
                }
                
            }
        }
    }
    
    // MARK: LOAD IMAGE FILE
    private func load(fileName: String) -> UIImage? {
        let fileURL = documentsUrl.appendingPathComponent(repo_n+"/"+fileName)
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
        Repo_View_Directory(repo_n: "TEST", ec2_id: "3.34.194.172")
    }
}
