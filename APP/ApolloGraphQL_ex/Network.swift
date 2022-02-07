//
//  Network.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/06.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

    let url = "https://apollo-fullstack-tutorial.herokuapp.com/graphql" // Udapte this link with your API link

    private(set) lazy var apollo = ApolloClient(url: URL(string: url)!)
}
