//
//  Network.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/09.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

    let url = "http://3.35.46.50:4000/" // Udapte this link with your API link

    private(set) lazy var apollo = ApolloClient(url: URL(string: url)!)
}
