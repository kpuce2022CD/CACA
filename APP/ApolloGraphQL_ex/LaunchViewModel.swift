//
//  LaunchViewModel.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/06.
//

import Foundation
import Apollo

final class LaunchViewModel: ObservableObject {
    @Published var launches: Launches = Launches.init()
    
    init(){
        fetch()
    }

    func fetch() {
        Network.shared.apollo.fetch(query: LaunchListQuery()) { result in // Change the query name to your query name
          switch result {
          case .success(let graphQLResult):
//            print("Success! Result: \(graphQLResult)")
              if let launches = graphQLResult.data?.launches {
                  print("Success! Result: \(launches.hasMore) \(launches.cursor)")
                  self.launches = self.process(data: launches)
              } else if let errors = graphQLResult.errors {
                      print("GraphQL errors \(errors)")
              }
              
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
    
    func process(data: LaunchData) -> Launches {
        return Launches(data)
    }

}
