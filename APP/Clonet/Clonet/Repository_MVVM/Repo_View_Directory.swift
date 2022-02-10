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
    @State var repoName_test = "TEST"
    @Published var items = [String]()
    @Published var text : String = ""
    @State var saveCheck : Bool = true
    
    init(){
        location(repoName: self.repoName_test)
        text = readMELoad(fileName: "README.md")
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
    
    // MARK: READ STRING FILE
    func readMELoad(fileName: String) -> String {
        var result = ""
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(repoName_test+"/"+fileName)
            
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
            let fileURL = dir.appendingPathComponent(repoName_test+"/"+fileName)
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
            // add File
            let fileManager = FileManager.default
            let directoryURL = documentURL.appendingPathComponent("TEST/cat.png")
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
    @State var ImageName : String = "Clonet_logo"
    @State var CommitTime : String = "21.09.20"
    @State var CommitMessage : String = "Commit Message"
    @State var fileNameImg = "" // to Store File Name picked
    @State private var editREADME : Bool = true // determine README or not
    @State var saveCheck : Bool = false
    
    
    
    init(repo_n: String, ec2_id: String){
        self.repo_n = repo_n
        self.ec2_id = ec2_id
    }
    
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
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
                    DocumentPicker(alert: self.$alert)
                }
                .alert(isPresented: $alert) {
                    Alert(title: Text("Message"), message: Text("Upload Successfully"), dismissButton: .default(Text("OK")))
                }
                List{
                    
                    ForEach(dataList.items, id: \.self){ i in
                        //                        Text(i)
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


//struct Repo_View_Directory_Previews: PreviewProvider {
//    static var previews: some View {
//        Repo_View_Directory
//    }
//}
