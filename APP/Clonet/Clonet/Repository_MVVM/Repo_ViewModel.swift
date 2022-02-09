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
    
    init(){
        fetch()
    }
    
    func fetch(){
//        var Log_repo_list : [Log_repo] = []
        Network.shared.apollo.fetch(query: LogRepoQuery(repo_name: "TEST")){ result in
            switch result {
            case .success(let graphQLResult):
                
                if let log_repos = graphQLResult.data?.logRepo {
//                    print("Success! Result: \(log_repos.indices) \(log_repos.count)")
                    for i in log_repos.indices{
                        self.launches = self.process(data: graphQLResult.data?.logRepo![i] ?? logrepoData.init(commitMsg: "", date: "", commitId: "", userId: ""))
                        self.Log_repo_list.append(self.launches)
//                        print("\(self.Log_repo_list)")
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
//        print("\(Log_repo(data))")
        return Log_repo(data)
    }
    
}
