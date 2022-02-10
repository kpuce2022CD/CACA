//
//  Repo_View_Directory.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI
import MobileCoreServices
import Foundation

final class getFileList: ObservableObject{
    @State var repoName_test = "test"
    @Published var items = [String]()
    @Published var text : String = ""
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
    
    func printLine(fileName: String) -> String {
        let filename = fileName
        var str1: String
        var myCounter: Int
        do {
            let contents = try String(contentsOfFile: filename)
            let lines = contents.split(separator:"\n")
            myCounter = lines.count
            str1 = String(myCounter)
            } catch {
                return (error.localizedDescription)
            }
            return str1
    }
    
    func readMELoad(fileName: String) -> String {
        var result = ""
         
        //if you get access to the directory
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
         
            //prepare file url
            let fileURL = dir.appendingPathComponent(repoName_test+"/"+fileName)
         
            do {
                result = try String(contentsOf: fileURL, encoding: .utf8)
                print(result)
                return result
            }
            catch {print("fail to load readme")}
        }
        return result
    }
    
    func readMEsave(text: String) {
        var fileName : String = "README.md"
//        let filename = getDocumentsDirectory().appendingPathComponent(repoName_test+"/"+fileName)

        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let fileURL = dir.appendingPathComponent(repoName_test+"/"+fileName)
        do {
            try text.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            print("save success")
        } catch {
            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
            print("save fail")
            }
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
    @State private var editREADME : Bool = true
    
    
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
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
                        if(i != ".git"){
                            Button(i, action: {
                                fileNameImg = i
                                if(i == "README.md"){
//                                    text = printLine(fileName: i)
//                                    print("text", text)
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
                        Button("Save", action: {dataList.readMEsave(text: dataList.text)})
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
    
//    func printLine(fileName: String) -> String {
//        let filename = fileName
//        var str1: String
//        var myCounter: Int
//        do {
//            let contents = try String(contentsOfFile: filename)
//            let lines = contents.split(separator:"\n")
//            myCounter = lines.count
//            str1 = String(myCounter)
//            } catch {
//                return (error.localizedDescription)
//            }
//            return str1
//    }
    
    
    
}


struct Repo_View_Directory_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Directory()
    }
}
