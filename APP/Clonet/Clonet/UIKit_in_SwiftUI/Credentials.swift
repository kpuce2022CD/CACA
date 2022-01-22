//
//  Credentials.swift
//  Clonet
//
//  Created by 박지영 on 2022/01/22.
//

import Foundation
import Clibgit2
import SwiftGit2

extension Credentials {
    func toPointer() -> UnsafeMutableRawPointer {
        return Unmanaged.passRetained(Wrapper(self)).toOpaque()
    }
    static func fromPointer_A(_ pointer: UnsafeMutableRawPointer) -> Credentials {
        return Unmanaged<Wrapper<Credentials>>.fromOpaque(UnsafeRawPointer(pointer)).takeRetainedValue().value
    }
    
}

func credentialsCallback(
    cred: UnsafeMutablePointer<UnsafeMutablePointer<git_cred>?>?,
    url: UnsafePointer<CChar>?,
    username: UnsafePointer<CChar>?,
    _: UInt32,
    payload: UnsafeMutableRawPointer? ) -> Int32 {

    let result: Int32

    // Find username_from_url
    let name = username.map(String.init(cString:))

    switch Credentials.fromPointer_A(payload!) {
    case .default:
        result = git_cred_default_new(cred)
    case .sshAgent:
        result = git_cred_ssh_key_from_agent(cred, name!)
    case .plaintext(let username, let password):
        result = git_cred_userpass_plaintext_new(cred, username, password)
    case .sshMemory(let username, let publicKey, let privateKey, let passphrase):
        result = git_cred_ssh_key_memory_new(cred, username, publicKey, privateKey, passphrase)
    }

    return (result != GIT_OK.rawValue) ? -1 : 0
}


class Wrapper<T> {
    let value: T

    init(_ value: T) {
        self.value = value
    }
}
