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
