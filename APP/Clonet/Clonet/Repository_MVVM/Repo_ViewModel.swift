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
    @Published var launches_ip: Ip_repo = Ip_repo.init()
    @Published var Log_repo_list : [Log_repo] = []
    @Published var repo_n: String = ""
    @Published var repoIP_Addr : String = ""
    
    func appear(){
        fetch(Repo_Name: self.repo_n)
        repoIP(Repo_Name: self.repo_n)
    }

    
    func repoIP(Repo_Name: String){
        Network.shared.apollo.fetch(query: SelectRepoQuery(repo_name: Repo_Name)){ result in
            switch result {
            case .success(let graphQLResult):
                if let ip_repos = graphQLResult.data?.selectRepo {
                    for i in ip_repos.indices{
                        self.launches_ip = self.process_ip(data: ip_repos[i] ?? iprepoData.init(repoName: "", repoEc2Ip: ""))
//                        print("launces_ip:", self.launches_ip.repo_ec2_ip)
//                        self.repoIP_Addr = self.launches_ip.repo_ec2_ip
                        self.repoIP_Addr = "http://" + self.launches_ip.repo_ec2_ip + "/git-repositories/" + self.repo_n + ".git"
                        print("launces_ip:", self.repoIP_Addr)
                    }
                } else if let errors = graphQLResult.errors {
                    print("GraphQL errors \(errors)")
                }
                
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
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
    
    func process_ip(data: iprepoData) -> Ip_repo {
        return Ip_repo(data)
    }
    
}
