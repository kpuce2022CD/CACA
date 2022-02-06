//
//  LaunchViewModel.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/06.
//

import Foundation
import Apollo

final class LaunchViewModel: ObservableObject {
    
    init(){
        fetch()
    }

    func fetch() {
        Network.shared.apollo.fetch(query: LaunchListQuery()) { result in // Change the query name to your query name
          switch result {
          case .success(let graphQLResult):
            print("Success! Result: \(graphQLResult)")
          case .failure(let error):
            print("Failure!!! Error: \(error)")
          }
        }
    }

}
