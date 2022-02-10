//
//  Repo_ViewModel.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/04.
//

import Foundation
import Apollo

final class log_repo_ViewModel: ObservableObject{
    @Published var launches: Log_repo = Log_repo.init()
    @Published var Log_repo_list : [Log_repo] = []
    @Published var repo_n: String = ""
    
    func appear(){
        fetch(Repo_Name: self.repo_n)
    }

    
    func fetch(Repo_Name: String){
        Network.shared.apollo.fetch(query: LogRepoQuery(repo_name: Repo_Name)){ result in
            switch result {
            case .success(let graphQLResult):
                if let log_repos = graphQLResult.data?.logRepo {
                    for i in log_repos.indices{
                        self.launches = self.process(data: graphQLResult.data?.logRepo![i] ?? logrepoData.init(commitMsg: "", date: "", commitId: "", userId: ""))
                        self.Log_repo_list.append(self.launches)
                    }
                } else if let errors = graphQLResult.errors {
                    print("GraphQL errors \(errors)")
                }
                
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    
    func process(data: logrepoData) -> Log_repo {
        return Log_repo(data)
    }
    
}
