//
//  Repo_View_Directory.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI

final class getFileList: ObservableObject{
    @Published var items = [String]()
    
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

struct Repo_View_Directory: View {
    @ObservedObject var dataList = getFileList()
    
    var body: some View {
        List{
            ForEach(dataList.items, id: \.self){ i in
                Text(i)
            }
        }
    }
}

struct Repo_View_Directory_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Directory()
    }
}
