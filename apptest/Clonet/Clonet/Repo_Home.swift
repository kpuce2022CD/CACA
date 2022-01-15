//
//  Repo_Home.swift
//  Clonet
//
//  Created by 박지영 on 2022/01/15.
//

import SwiftUI

struct Repo_Home: View {
    
    @State private var selectionString: String? = nil
    
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("표시할 그림 선택 ")
                    Picker(selection: .constant(1), label: Text("Branch")) {
                        Text("최종").tag(1)
                        Text("최종최종").tag(2)
                    }
                    .pickerStyle(MenuPickerStyle())
                }
        
                
                ZStack {
                    Button(action: {
                        self.selectionString = "branchButton"
                    }) {
                        HStack{
                            Image(systemName: "arrow.triangle.branch")
                            Text("브랜치")
                        }
                        
                        .frame(width: 300, height: 50)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 2)
                        )
                    }
                    .background(Color.black)
                    .cornerRadius(15)
                    
                    NavigationLink(destination: EmptyView(), tag: "branchButton", selection: $selectionString) { }
                    .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                }
//                list.bullet
                HStack {
                    ZStack {
                        Button(action: {
                            self.selectionString = "branchButton"
                        }) {
                            HStack{
                                Image(systemName: "arrowshape.turn.up.backward.fill")
                                Text("이전 상태로")
                            }
                            
                            .frame(width: 146, height: 50)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                        }
                        .background(Color.black)
                        .cornerRadius(15)
                        
                        NavigationLink(destination: EmptyView(), tag: "branchButton", selection: $selectionString) { }
                        .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                    }
                    ZStack {
                        Button(action: {
                            self.selectionString = "branchButton"
                        }) {
                            HStack{
                                Image(systemName: "list.bullet")
                                Text("로그확인")
                            }
                            
                            .frame(width: 146, height: 50)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                        }
                        .background(Color.black)
                        .cornerRadius(15)
                        
                        NavigationLink(destination: EmptyView(), tag: "branchButton", selection: $selectionString) { }
                        .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                    }
                }
                ZStack {
                    Button(action: {
                        self.selectionString = "branchButton"
                    }) {
                        HStack{
                            Image(systemName: "list.bullet")
                            Text("다운로드")
                        }
                        
                        .frame(width: 300, height: 50)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 2)
                        )
                    }
                    .background(Color.black)
                    .cornerRadius(15)
                    
                    NavigationLink(destination: EmptyView(), tag: "branchButton", selection: $selectionString) { }
                    .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                }
                ZStack {
                    Button(action: {
                        self.selectionString = "branchButton"
                    }) {
                        Text("커밋하기")
                            .frame(width: 300, height: 50)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    .background(Color.green)
                    .cornerRadius(15)
                    
                    NavigationLink(destination: EmptyView(), tag: "branchButton", selection: $selectionString) { }
                    .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                
                
                HStack{
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                    VStack (alignment: .leading) {
                        HStack {
                            Text("Last Update by")
                            Text("kkkingsaida")
                                .bold()
                                .font(.headline)
                        }
                        HStack {
                            Text("branch")
                                .bold()
                            Text("21.09.20")
                        }
                    }
                }
                
                
            }
            .padding()
            
            //오른쪽
            VStack (alignment: .leading) {
                Image("Clonet_logo")
                    .resizable()
                .frame(width: 500, height: 500)
                .padding()
                
                HStack {
                    VStack (alignment: .leading){
                        HStack {
                            Text("Branch")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                            Text("21.09.20")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                        }
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                        Text("완성본")
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                    }
                    
                }
                
            }
            VStack{
                ZStack {
                    Button(action: {
                        self.selectionString = "branchButton"
                    }) {
                        Text("요청사항 보기")
                            .frame(width: 150, height: 50)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    .background(Color.black)
                    .cornerRadius(15)
                    
                    NavigationLink(destination: EmptyView(), tag: "branchButton", selection: $selectionString) { }
                    .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                }
                ZStack {
                    
                    Button(action: {
                        self.selectionString = "branchButton"
                    }) {
                        Text("전체 보기")
                            .frame(width: 150, height: 50)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    .background(Color.black)
                    .cornerRadius(15)
                    
                    NavigationLink(destination: EmptyView(), tag: "branchButton", selection: $selectionString) { }
                    .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                }
                
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                Image(systemName: "person.crop.circle.fill.badge.plus")
                    .resizable()
                    .frame(width: 60, height: 50)
                
                Spacer()
                ZStack {
                    Button(action: {
                        self.selectionString = "branchButton"
                    }) {
                        Text("Detail")
                            .frame(width: 100, height: 50)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    .background(Color.green)
                    .cornerRadius(15)
                    
                    NavigationLink(destination: EmptyView(), tag: "branchButton", selection: $selectionString) { }
                    .buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                }
            }
            .padding(.vertical, 100.0)
        }
    }
}

struct Repo_Home_Previews: PreviewProvider {
    static var previews: some View {
        Repo_Home()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
