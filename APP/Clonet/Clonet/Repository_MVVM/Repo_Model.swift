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

struct Log_repo: Decodable {
    var id = UUID()
    var commitMsg : String
    var date : String
    var commitId : String
    var userId : String
    
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
