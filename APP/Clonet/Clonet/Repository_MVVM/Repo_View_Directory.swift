//
//  Repo_View_Directory.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI

struct Repo_View_Directory: View {
    @State var items = [String]()
    let faceLocation = documentURL.appendingPathComponent("hey")

    var body: some View {
        VStack{
            Button("directory", action: location)
            List{
                ForEach(items, id: \.self){ item in
                    HStack{
                        Text(item)
                    }
                }
            }
        }
    }
    
    func location(){
        let urlString = faceLocation.absoluteString
        let fileManager = FileManager.default
        var remoteString = urlString.replacingOccurrences(of: "file://", with: "")
        
        do{
            //let
            items = try fileManager.contentsOfDirectory(atPath: remoteString)
            print("aaad: \(items)")
//            for item in items{
//                print("Found \(item)")
//            }
        }catch{
            print("error")
        }
    }
}

struct Repo_View_Directory_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Directory()
    }
}
