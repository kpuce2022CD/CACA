//
//  Repository.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/01/21.
//

import Foundation
import Result
import SwiftGit2
//import Clibgit2
//import libgit2



let gitAuthor = Signature.init(name: "Git Writing", email: "gitwriting@example.com")

extension Repository {
    
    //
//        public func push(repo: Repository) -> Result<Repository, NSError>{
//            var git_remote : OpaquePointer? = nil
//    //        let pushUrl = git_remote_pushurl(git_remote)
//            let lookup_result = git_remote_lookup(&git_remote, repo.pointer, "origin")
//    
//            var option : git_push_options? = nil
//            let push_init_result = git_push_options_init(git_push_options, UInt32(GIT_PUSH_OPTIONS_VERSION))
//    
//            var refspec = "refs/heads/master"
//            var refspecs : git_strarray = git_s
//            let push_result = git_remote_push(git_remote, <#T##refspecs: UnsafePointer<git_strarray>!##UnsafePointer<git_strarray>!#>, <#T##opts: UnsafePointer<git_push_options>!##UnsafePointer<git_push_options>!#>)
//        }
    
    //
    ////    func push() -> Result<Repository, NSError>{
    ////
    ////        let localRepoLocation = documentURL.appendingPathComponent("a")
    ////        let result = Repository.at(localRepoLocation)
    ////        switch result {
    ////        case let .success(repo):
    ////            var options = git_push_options()
    ////            git_push_init_options(&options, UInt32(GIT_PUSH_OPTIONS_VERSION))
    ////
    ////
    ////        case let .failure(error):
    ////            print("fail")
    ////        }
    ////
    ////        let repository = Repository(pointer)
    ////        return Result.success(repository)
    ////
    ////    }
    //
    //
    //
    
    
    
//    func shortName() -> String? {
//        return directoryURL?.lastPathComponent
//    }
//
//    func addAllAndCommit(message: String) -> Result<Commit, NSError> {
//        return addAll().flatMap {
//            commit(message: message, signature: gitAuthor)
//        }
//    }

    // Stages all files
    func addAll() -> Result<(), NSError> {
        return add(path: ".")
    }

//    func pushToOrigin() {
//        guard let localBranch = HEAD().value as? Branch else {
//            print("Can't push - not on a branch")
//            return
//        }
//        guard let remoteBranch = remoteBranch(named: "origin/master").value else {
//            print("Can't push - no remote branch with name origin/master")
//            return
//        }
//        guard let credentials = ClonetCredentials.get() else {
//            return
//        }
//
//        let pushResult = remote(named: "origin").flatMap {
//            push(remote: $0, branch: localBranch, credentials: credentials)
//        }
//
//        switch pushResult {
//        case .success:
//            print("Push to origin succeeded")
//        case let .failure(error):
//            print("Push failed: \(error)")
//        }
//    }
//
//
//    public func remote(named name: String) -> Result<Remote, NSError> {
//        var pointer: OpaquePointer? = nil
//        let result = git_remote_lookup(&pointer, self.pointer, name)
//
//        guard result == GIT_OK.rawValue else {
//            return Result.failure(NSError(gitError: result, pointOfFailure: "git_remote_lookup"))
//        }
//    }
//
//    public func push(remote: Remote, branch: Branch, credentials: Credentials){
//
//    }


}
