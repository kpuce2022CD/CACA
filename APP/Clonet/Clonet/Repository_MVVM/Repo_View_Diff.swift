//
//  Repo_View_Diff.swift
//  Clonet
//
//  Created by Jimin on 2022/03/15.
//

import SwiftUI

class MDResult: ObservableObject{
    @Published var text : String = ""
    
    func MDView(url: String) -> String{
        var result = ""
        do{
            text = try String(contentsOf: URL(string: url)!, encoding: .utf8)
            print("MDMDMDMDREAD",text, url)
            return text
        }
        catch {print("fail to load readme")}
        
        return result
    }
}

struct Repo_View_Diff: View {
    @State var ImgOpacity = 0.5
    @State var text1: String = ""
    @State var text2: String = ""
    @ObservedObject var logNumber : LogNumber
    @ObservedObject var mdList = MDResult()
    
    init(ImgOpacity: Double, logNumber: LogNumber){
        self.ImgOpacity = ImgOpacity
        self.logNumber = logNumber
    }
    
    var body: some View{
        VStack {
//            Text("GEE \(logNumber.url1)")
//            Text("GEE \(logNumber.url2)")
            
            HStack{
                if(logNumber.url1.contains(".txt") == true || logNumber.url1.contains(".md") == true){
//                    Button(action: {
//                        mdList.MDView(url: logNumber.url1)
//                    }, label: {Text("aa")})
                    VStack{
                        Text("**First Commit**")
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                        Spacer()
                        Text("\(text1)")
                            .font(.system(size: 17))
                            .frame(width: 400, height: 400, alignment: .center)
                            .cornerRadius(20)
                    }
                    VStack{
                        Text("**Second Commit**")
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                        Spacer()
                        Text("\(text2)")
                            .font(.system(size: 17))
                            .frame(width: 400, height: 400, alignment: .center)
                            .cornerRadius(20)
                    }
                }else{
                    AsyncImage(url: URL(string: logNumber.url1), scale: 2){ image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                    .frame(width: 400, height: 400, alignment: .center)
                    .cornerRadius(20)
                    
                    AsyncImage(url: URL(string: logNumber.url2),scale: 2){ image in
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
            }
            Spacer()
            
            Text("Now you see me \(ImgOpacity)")
                .padding()
                .background(Color.red)
                .opacity(ImgOpacity)
            
            Slider(value: self.$ImgOpacity, in: 0.0...1.0)
        }.padding()
            .onAppear(perform: {
                print("self.logNumber.url", logNumber.url1)
                self.text1 = mdList.MDView(url: logNumber.url1)
                self.text2 = mdList.MDView(url: logNumber.url2)
            })
    }
}

struct Repo_View_Diff_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Diff(ImgOpacity: 0.5, logNumber:LogNumber())
    }
}
