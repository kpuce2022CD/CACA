//
//  Repo_Model.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import os

//import Foundation

typealias logrepoData = LogRepoQuery.Data.LogRepo

struct Log_repo: Decodable {
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

//public struct Log_repo {
//
//    var loges: Log_repo// = [Log.init()]
//
//    init(_ loges: logrepoData?){
//
////        self.loges.map({l -> Log_repo in
////            Log_repo(l)
////        }) ?? []
//
//    }
//
//    struct Log_repo: Decodable{
//        var commitMsg : String
//        var date : String
//        var commitId : String
//        var userId : String
//
//        init(){
//            self.commitMsg = ""
//            self.date = ""
//            self.commitId = ""
//            self.userId = ""
//        }
//
//        init(_ log_repos: logrepoData){
//            self.commitMsg = log_repos.commitMsg ?? ""
//            self.date = log_repos.date ?? ""
//            self.commitId = log_repos.commitId ?? ""
//            self.userId = log_repos.userId ?? ""
//        }
//    }
//
////    init(){
////        self.commitMsg = ""
////        self.date = ""
////        self.commitId = ""
////        self.userId = ""
////    }
//
//
//}


