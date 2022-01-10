//
//  User.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/10.
//

import Foundation

struct User : Codable, Identifiable {
    var id : String
    var password : String
}
