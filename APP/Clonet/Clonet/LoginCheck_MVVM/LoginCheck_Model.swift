//
//  LoginCheck_Model.swift
//  Clonet
//
//  Created by Jimin on 2022/02/09.
//

import Foundation

typealias RepoListData = RepoListQuery.Data.RepoList

struct RepoNameList: Decodable, Equatable{
    var id = UUID()
    var repo_name: String
    var user_id: String

    init(){
        self.repo_name = ""
        self.user_id = ""
    }

    init(_ repoList: RepoListData?){
        self.repo_name = repoList?.repoName ?? ""
        self.user_id = repoList?.userId ?? ""
    }
    
    static func == (lhs: RepoNameList, rhs: RepoNameList) -> Bool {
        return lhs.id == rhs.id &&
        lhs.repo_name == rhs.repo_name &&
        lhs.user_id == rhs.user_id
    }
}
