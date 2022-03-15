//
//  Repo_View_Diff.swift
//  Clonet
//
//  Created by Jimin on 2022/03/15.
//

import SwiftUI

struct Repo_View_Diff: View {
    @State var ImgOpacity = 0.5
    var url1 = ""
    var url2 = ""
    
    init(ImgOpacity: Double, url1: String, url2: String){
        self.ImgOpacity = ImgOpacity
        self.url1 = url1
        self.url2 = url2
    }
    
    var body: some View{
        VStack {
            Text("GEE \(url1)")
            Text("GEE \(url2)")
            HStack{
                AsyncImage(url: URL(string: url1), scale: 2){ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                .frame(width: 400, height: 400, alignment: .center)
                .cornerRadius(20)
                
                AsyncImage(url: URL(string: url2),scale: 2){ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .opacity(ImgOpacity)
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                .frame(width: 400, height: 400, alignment: .center)
                .cornerRadius(20)
                
            }
            Spacer()
            
            Text("Now you see me \(ImgOpacity)")
                .padding()
                .background(Color.red)
                .opacity(ImgOpacity)
            
            Slider(value: self.$ImgOpacity, in: 0.0...1.0)
        }.padding()
    }
}

struct Repo_View_Diff_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Diff(ImgOpacity: 0.5, url1: "", url2: "")
    }
}
