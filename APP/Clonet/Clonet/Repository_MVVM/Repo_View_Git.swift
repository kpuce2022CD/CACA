//
//  Repo_View_Git.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import SwiftUI

struct Repo_View_Git: View {
    var body: some View {
        VStack{
            // MARK: RollBack Button
            Button(action: {
                
            }){
                HStack{
                    Image(systemName: "arrow.counterclockwise")
                    Text("RollBack")
                }
                
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 2)
                )
            }
            .background(Color.black)
            .cornerRadius(15)
            
            // MARK: Commit Button
            Button(action: {
                
            }){
                HStack{
                    Image(systemName: "opticaldiscdrive.fill")
                    Text("Commit")
                }
                
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 2)
                )
            }
            .background(Color.black)
            .cornerRadius(15)
            
            // Clone & Pull Button
            HStack{
                // MARK: Clone Button
                Button(action: {
                    
                }){
                    HStack{
                        Image(systemName: "square.and.arrow.down")
                        Text("Clone")
                    }
                    
                    .frame(width: 100, height: 50)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.white, lineWidth: 2)
                    )
                }
                .background(Color.black)
                .cornerRadius(15)
                
                // MARK: Pull Button
                Button(action: {
                    
                }){
                    HStack{
                        Image(systemName: "square.and.arrow.down")
                        Text("Pull")
                    }
                    
                    .frame(width: 100, height: 50)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.white, lineWidth: 2)
                    )
                }
                .background(Color.black)
                .cornerRadius(15)
            }
            
            // MARK: Branch
            Button(action: {
                
            }){
                HStack{
                    Image(systemName: "arrow.triangle.branch")
                    Text("Branch")
                }
                
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 2)
                )
            }
            .background(Color.black)
            .cornerRadius(15)
            
            // MARK: Export
            Button(action: {
                
            }){
                HStack{
                    Image(systemName: "arrowshape.turn.up.forward.fill")
                    Text("Export")
                }
                
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 2)
                )
            }
            .background(Color.black)
            .cornerRadius(15)
        }
        .padding()
    }
}

struct Repo_View_Git_Previews: PreviewProvider {
    static var previews: some View {
        Repo_View_Git()
    }
}
