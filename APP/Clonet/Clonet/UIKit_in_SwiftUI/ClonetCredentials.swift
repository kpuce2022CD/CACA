//
//  ClonetCredentials.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/21.
//

import Foundation
import KeychainAccess
import SwiftGit2

class ClonetCredentials {
    static let keychain = Keychain(server: "http://54.180.94.152", protocolType: .https)

    static func set(username: String, password: String) {
        do {
            try keychain.set(username, key: "ubuntu")
            try keychain.set(password, key: "qwer1234")
        } catch {
            print("Error saving credentials to keychain: \(error)")
        }
    }

    static func get() -> Credentials? {
        do {
            let username = try keychain.get("ubuntu")
            let password = try keychain.get("qwer1234")
            if let username = username, let password = password {
                return Credentials.plaintext(username: username, password: password)
            }
        } catch {
            print("Error fetching credentials from keychain")
        }

        return nil
    }
}
