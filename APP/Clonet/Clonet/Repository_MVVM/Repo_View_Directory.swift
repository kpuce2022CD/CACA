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
//import Combine
import Apollo
import SwiftGit2

class Pixel : ObservableObject {
    @Published var RequestedLocation_x = 0.0
    @Published var RequestedLocation_y = 0.0
    
    func change_Pixel(x: String, y: String){
        RequestedLocation_x = Double(x) ?? 0.0
        RequestedLocation_y = Double(y) ?? 0.0
        print("processPixels Pixel()", RequestedLocation_x)
        print("processPixels Pixel()", RequestedLocation_y)
    }
}


// MARK: Repo_View_Directory: View
struct Repo_View_Directory: View {
    
    @State var repo_n : String
    @State var ec2_id : String
    @State var user_id : String
    
    
    @ObservedObject var dataList = getFileList()
    @State var show = false
    @State var exportShow = false
    @State var alert = false
    
    //Repo_View_Image
    @State var fileNameImg = "" // to Store File Name picked
    @State private var editText : Bool = true // determine README or not
    @State var saveCheck : Bool = false
    
    @State var exportFileName : String = ""
    
    @State private var presentingToast: Bool = false
    
    //Repo_Message_Toast
    @State private var editText_toast : Bool = true // determine README or not
    @State private var location = CGPoint.zero
    @State private var messageToast: Bool = false
    @State private var messageInput = ""
    @State var Repo_ViewModel_req = log_repo_ViewModel()
    @State var Req_repo_list : [Request] = []
    @State private var messagePoint: Bool = false
    
    @State private var pointShowing : Bool = false
    
    @ObservedObject var pixel = Pixel()
    
    // 현재 브랜치 이름
    @ObservedObject var branchNameObject : BranchName = BranchName()
    // log
    @State var Log_repo_list : Array<Log_repo> = []
    
    init(repo_n: String, ec2_id: String, user_id: String){
        Repository.initialize_libgit2()
        
        self.repo_n = repo_n
        self.ec2_id = ec2_id
        self.user_id = user_id
        dataList.first(repo_n: self.repo_n)
        dataList.repoName = repo_n
    }
    
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func deleteFile(at offsets: IndexSet){
        print("IndexSet \(offsets[offsets.startIndex])")
        print("IndexSet name : " + "\(self.repo_n)/" + "\(dataList.items[offsets[offsets.startIndex]])")
        
        // delete File
        let fileManager = FileManager.default
        let path = documentsUrl.path
        
        do{
            try fileManager.removeItem(atPath: path + "/\(self.repo_n)/" + "\(dataList.items[offsets[offsets.startIndex]])")
        }catch let e {
            print("\(e)")
        }
        
        dataList.items.remove(atOffsets: offsets)
    }
    
    // MARK: EXPORT
    struct ShareSheet: UIViewControllerRepresentable {
        typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void
        
        let activityItems: [Any]
        let applicationActivities: [UIActivity]? = nil
        let excludedActivityTypes: [UIActivity.ActivityType]? = nil
        let callback: Callback? = nil
        
        
        
        func makeUIViewController(context: Context) -> UIActivityViewController {
            let controller = UIActivityViewController(
                activityItems: activityItems,
                applicationActivities: applicationActivities)
            
            controller.excludedActivityTypes = excludedActivityTypes
            controller.completionWithItemsHandler = callback
            return controller
        }
        
        func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
            // nothing to do here
        }
    }
    
    
    var body: some View {
        HStack{
            VStack{
                
                HStack{
                    Spacer()
                    // MARK: Document Picker Button (To add)
                    Button(action:{
                        self.show.toggle()
                    }){
                        Image(systemName: "square.and.arrow.down")
                            .frame(width: 30.0, height: 30.0)
                    }
                    .sheet(isPresented: $show){
                        DocumentPicker(alert: self.$alert, repo_name: self.$repo_n, img_name: self.$fileNameImg)
                    }
                    .alert(isPresented: $alert) {
                        Alert(title: Text("Message"), message: Text("Upload Successfully"), dismissButton: .default(Text("OK")))
                    }
                    Spacer()
                    
                    // MARK: EXPORT Document Picker
                    
                    Button(action: {
                        exportShow = true
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .frame(width: 30.0, height: 30.0)
                    }
                    .sheet(isPresented: $exportShow) {
                        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                            let fileURL = dir.appendingPathComponent(repo_n + "/")
                            ShareSheet(activityItems: [fileURL])
                        }
                    }
                    Spacer()
                }
                
                VStack{
                    // MARK: Show File List
                    List{
                        Section(header: Text("File List").font(.largeTitle)) {
                            ForEach(dataList.items, id: \.self){ i in
                                if(i != ".git"){
                                    Button(i, action: {
                                        fileNameImg = i
                                        var fileNameTxt = fileNameImg.components(separatedBy: ".")
                                        if(fileNameTxt[1] == "md" || fileNameTxt[1] == "txt"){
                                            print("dataList:", fileNameImg)
                                            dataList.readMELoad(repoName: repo_n, fileName: fileNameImg)
                                            editText = true
                                        } else{
                                            editText = false
                                        }
                                        var fileName_Req = repo_n + "_" + i
//                                        print("fileName_Req", fileName_Req)
                                        Repo_ViewModel_req.Request_fetch(Repo_Name: fileName_Req)
//                                        print("Repo_ViewModel_req.Req_repo_list1", Repo_ViewModel_req.Req_repo_list)
                                    })
                                }
                            }
                            .onDelete{
                                deleteFile(at: $0)
                            }
                        }
                        
                        // MARK: Request Message List
                        Section(header: Text("Message").font(.largeTitle)) {
                            
                            ForEach(Repo_ViewModel_req.Req_repo_list, id: \.id) { s in
                                Button(s.request_context, action: {
                                    print("processPixels")
                                    messagePoint = true
                                    pixel.change_Pixel(x: s.x_pixel, y: s.y_pixel)
                                    pointShowing = true
                                })
                            }
                            .onAppear {
                                var fileName_Req = repo_n + "_" + fileNameImg
                                Repo_ViewModel_req.Request_fetch(Repo_Name: fileName_Req)
                                
                            }
                            Button(action: {
                                pointShowing = false
                            },
                            label: {Text("Cancel").foregroundColor(Color.red)})
                        }
                        
                        // MARK: Log List
                        Section(header: Text("Log").font(.largeTitle)) {
         
                            ForEach(Log_repo_list, id: \.id){ index in
                                Button(index.userId + " : " + index.commitMsg){
                                    
                                }
                            }

                        }
                        .onAppear(){
                            self.getBranchLog()
                        }
                    }
                    .refreshable{
                        Repo_ViewModel_req.fetch(Repo_Name: repo_n)
                        self.getBranchLog()
                    }
                    .frame(width: 300)
                    
                }
            }
            
            
            
            
            
            //MARK: Repo_View_Image
            VStack{
                if editText {
                    VStack{
                        TextEditor(text: $dataList.text)
                            .padding()
                            .foregroundColor(Color.black)
                            .lineSpacing(5) //줄 간격
                        
                            .frame(width: 500, height: 500)
                            .border(Color.yellow, width: 1)
                            .onAppear(perform: {print("dataText: ", dataList.text)})
                        Button("Save", action: {
                            dataList.readMEsave(repoName: repo_n, text: dataList.text, fileName: fileNameImg)
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
                    
                    GeometryReader { innerProxy in
                        let local = innerProxy.frame(in: .local)
                        let global = innerProxy.frame(in: .global)
                        ZStack{
                            if pointShowing{
                                Circle()
                                    .foregroundColor(Color.red)
                                    .frame(width: 20.0, height: 20.0)
                                    .position(CGPoint.init(x: pixel.RequestedLocation_x, y: pixel.RequestedLocation_y))
                                    .zIndex(1)
                            }
                            
                            Image(uiImage: load(fileName: fileNameImg)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit) // Image 깨지지 않게 크기 처리
                                .frame(width: 500, height: 500, alignment: .center)
                                .padding()
                                }
                        }
                    .gesture(LongPressGesture(minimumDuration: 0.5).sequenced(before: DragGesture(minimumDistance: 0)).onEnded { value in
                        switch value {
                        case .second(true, let drag):
                            location = drag?.location ?? .zero   // capture location !!
                            messageToast = true
                        default:
                            break
                        }
                        
                    })
                
                
                // MARK: Long click to Create Request
                    .toast(isPresented: $messageToast) {
                        ToastView {
                            VStack{
                                Section{
                                    Text("Add Message")
                                }
                                TextField("내용을 입력해주세요.", text: $messageInput)
                                Section{
                                    HStack{
                                        Button {
                                            
                                            let file_Name = "\(repo_n)_\(fileNameImg)"
                                            
                                            let x_pixel = "\(location.x)"
                                            let y_pixel = "\(location.y)"
                                            
                                            // Save Request && Fixel
                                            let Repo_ViewModel = log_repo_ViewModel()
                                            Repo_ViewModel.CreateRequest(user_id: user_id, repo_name: file_Name, x_pixel: x_pixel, y_pixel: y_pixel, request_context: messageInput)
                                            
                                            messageToast = false
                                            messageInput = ""
                                            
                                        } label: {
                                            Text("Save")
                                        }
                                        Button {
                                            messageToast = false
                                            messageInput = ""
                                        } label: {
                                            Text("Cancel")
                                        }
                                    }
                                }
                                
                            }
                        }
                        .frame(width: 220, height: 80)
                        
                    }
                    .frame(width: 500, height: 500, alignment: .center)
                
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
    
    // MARK: get Branch Log List
    public func getBranchLog(){
        let localRepoLocation = documentURL.appendingPathComponent(repo_n)
        let result = Repository.at(localRepoLocation)
        switch result {
        case let .success(repo):
            Log_repo_list.removeAll()
            
            Log_repo_list = repo.branchLog(repo, branchNameObject.currentBranchName).map({
                Log_repo.init(log: $0 as! Log_repo)
            })
            break
        case .failure(_):
            break
        }
    }
    
    
}


struct Repo_View_Directory_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Directory(repo_n: "TEST", ec2_id: "3.34.194.172", user_id: "user_id")
    }
}



//MARK: getFileList
final class getFileList: ObservableObject{
    @State var repoName = ""
    @Published var items = [String]() // Directory File List
    @Published var text : String = ""
    @State var saveCheck : Bool = true
    @State var fileName = ""
    
    //Timer
    var timer: Timer?
    
    func first(repo_n: String){
        self.repoName = repo_n
        location(repoName: repo_n)
        
        // Timer to get Data
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { _ in
            self.location(repoName: repo_n)
        })
    }
    
    deinit {
        timer?.invalidate()
    }
    
    // MARK: GET FILE LIST
    func location(repoName: String){
        let urlString = documentURL.appendingPathComponent(repoName).absoluteString
        let fileManager = FileManager.default
        var remoteString = urlString.replacingOccurrences(of: "file://", with: "")
        do{
            items = try fileManager.contentsOfDirectory(atPath: remoteString)
            //            print("items : \(items)")
        }catch{
            print("error")
        }
    }
    
    // MARK: READ STRING FILE
    func readMELoad(repoName: String, fileName: String) -> String {
        var result = ""
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(repoName+"/"+fileName)
            
            do {
                text = try String(contentsOf: fileURL, encoding: .utf8)
                return text
            }
            catch {print("fail to load readme")}
        }
        return result
    }
    
    // MARK: SAVE STRING FILE
    // MARK: 이 함수 README.md 말고 다른 파일도 저장할 수 있도록 바꿔주세요
    func readMEsave(repoName: String, text: String, fileName: String){
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
