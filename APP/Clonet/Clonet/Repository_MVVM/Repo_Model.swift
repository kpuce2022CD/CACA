//
//  Repo_Model.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import os
import Foundation
import SwiftUI

//import Foundation

typealias logrepoData = LogRepoQuery.Data.LogRepo
typealias iprepoData = SelectRepoQuery.Data.SelectRepo
typealias requestData = RequestRepoQuery.Data.RequestRepo
typealias groupUserData = GroupUserQuery.Data.GroupUser

struct UserList_repo: Decodable {
    var id = UUID()
    var user_id : String
    var repo_name: String
    
    init(){
        self.user_id = ""
        self.repo_name = ""
    }
    
    init(_ mappings: groupUserData?){
        self.user_id = mappings?.userId ?? ""
        self.repo_name = mappings?.repoName ?? ""
    }
}

class Log_repo: ObservableObject {
    @Published var id = UUID()
    @Published var commitMsg : String
    @Published var date : String
    @Published var commitId : String
    @Published var userId : String
    
    init(){
        self.commitMsg = ""
        self.date = ""
        self.commitId = ""
        self.userId = ""
    }
    
    init(_ launches: logrepoData?){
        self.commitMsg = launches?.commitMsg ?? ""
        self.date = launches?.date ?? ""
        self.commitId = launches?.commitId ?? ""
        self.userId = launches?.userId ?? ""
    }
    
    init(commitMsg: String, date: String, commitId: String, userId: String){
        self.commitMsg = commitMsg
        self.date = date
        self.commitId = commitId
        self.userId = userId
    }

}

struct Ip_repo : Decodable {
    var repo_name : String
    var repo_ec2_ip : String
    
    init(){
        self.repo_name = ""
        self.repo_ec2_ip = ""
    }
    
    init(_ launches: iprepoData?){
        self.repo_name = launches?.repoName ?? ""
        self.repo_ec2_ip = launches?.repoEc2Ip ?? ""
    }
}

struct Request : Decodable {
    var id = UUID()
    var user_id : String
    var repo_name : String
    var x_pixel : String
    var y_pixel : String
    var request_context : String

    init(){
        self.user_id = ""
        self.repo_name = ""
        self.x_pixel = ""
        self.y_pixel = ""
        self.request_context = ""
    }

    init(_ lauches: requestData?){
        self.user_id = lauches?.userId ?? ""
        self.repo_name = lauches?.repoName ?? ""
        self.x_pixel = lauches?.xPixel ?? ""
        self.y_pixel = lauches?.yPixel ?? ""
        self.request_context = lauches?.requestContext ?? ""
    }
}
