//
//  Repository.swift
//  Clonet
//
//  Created by 박지영 on 2022/01/22.
//

import Foundation
//import Result
import SwiftGit2
import Clibgit2
//import libgit2



let gitAuthor = Signature.init(name: "Git Writing", email: "gitwriting@example.com")

extension Repository {
    public func push(_ repo: Repository, _ username: String, _ password: String, _ branch: String? = nil){
        // todo get this properly
        
        let credentials: Credentials = Credentials.plaintext(username: username, password: password)
        var options = pushOptions(credentials: credentials)
//        print(options)
        let repository: OpaquePointer = repo.pointer
        var remote: OpaquePointer? = nil
        let result_git_remote_lookup = git_remote_lookup(&remote, repository, "origin" )
        
//        print("asdfaf", remote)
//        print(result_git_remote_lookup)
        
        
        func localBranches() -> Result<[Branch], NSError> {
            return references(withPrefix: "refs/heads/")
                .map { (refs: [ReferenceType]) in
                    return refs.map { $0 as! Branch }
                }
        }

        var master: String = ""
        if(branch == nil){
            if case .success = reference(named: "refs/heads/master") {
                master = "refs/heads/master"
                print("master-main")
            } else {
                let branchResult = repo.localBranches()
                switch branchResult {
                case .success(let branches):
                    print("found repo to use: \(branches[0].longName)") //get the first one for now :)
                    master = branches[0].longName
                    break
                case .failure:
                    print("Failed to get any branches...")
                    break
                }
            }
        } else {
            if case .success = reference(named: branch!) {
                master = "\(branch!)"
                print("master")
            } else {
                // Branch not found.
                var gitBranch: OpaquePointer?

                git_branch_create(&gitBranch, repository, branch!, nil, 1);
                print("Branch not found")
                master = "\(branch!)"
            }
        }

        if(master == ""){
            master = "refs/heads/master" // Prevents a crash below
        }

        
        print(master)

        let strings: UnsafeMutablePointer<UnsafeMutablePointer<CChar>?> = [master].withUnsafeBufferPointer {
            let buffer = UnsafeMutablePointer<UnsafeMutablePointer<CChar>?>.allocate(capacity: $0.count + 1)
            let val = $0.map
            { $0.withCString(strdup) }
            buffer.initialize(from: val, count: 1)
            buffer[$0.count] = nil
        return buffer
        }
        var gitstr = git_strarray()
        gitstr.strings = strings
        gitstr.count = 1
        
//        print(remote)
//        print(gitstr)
//        print(options)
        let push_result = git_remote_push(remote, &gitstr, &options)
        print(push_result)
        git_remote_free(remote)
    }
    
    
    private func pushOptions(credentials: Credentials = .default,
                              checkoutOptions: git_checkout_options? = nil) -> git_push_options {
        let pointer = UnsafeMutablePointer<git_push_options>.allocate(capacity: 1)
        git_push_init_options(pointer, UInt32(GIT_PUSH_OPTIONS_VERSION))
        
        

        var options = pointer.move()
        pointer.deallocate()
        
        
        options.callbacks.payload = credentials.toPointer()
        options.callbacks.credentials = credentialsCallback
        func pushTransferProgressCallback(
            current: UInt32,
            total: UInt32,
            bytes: size_t,
            payload: UnsafeMutableRawPointer? ) -> Int32 {
            let result: Int32 = 1
            return result
        }
        options.callbacks.push_transfer_progress = pushTransferProgressCallback

        return options
    }

}
