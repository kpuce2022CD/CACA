
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
    
    //MARK: reset
    public func log_reset(_ repo: Repository, reset_id: String){
        var revert_git_oid = git_oid()
        let nameToIDResult = git_oid_fromstr(&revert_git_oid, reset_id)
        
        //        var push_option = git_push_options()
        //        git_push_options_init(&push_option, UInt32(GIT_PUSH_OPTIONS_VERSION))
        
        var target: OpaquePointer? = nil
        git_object_lookup(&target, repo.pointer, &revert_git_oid, GIT_OBJECT_COMMIT)
        
        git_reset(repo.pointer, target, GIT_RESET_HARD, nil)
    }
    
    
    //MARK: REVERT
    public func revert_commit(_ repo: Repository, revert_id: String){
        
        var revert_git_oid = git_oid()
        let nameToIDResult = git_oid_fromstr(&revert_git_oid, revert_id)
        
        var git_commit_lookup_commit : OpaquePointer? = nil
        git_commit_lookup(&git_commit_lookup_commit, repo.pointer, &revert_git_oid)
        
        var git_revert_option = git_revert_options()
        var options = git_revert_options_init(&git_revert_option, UInt32(GIT_REVERT_OPTIONS_VERSION))
        
        let result = git_revert(repo.pointer, git_commit_lookup_commit, &git_revert_option)
        
        print("revert_commit \(result)")
        
    }
    
    // MARK: merge
    public func merge(_ repo: Repository){
        var git_annotated_commit_from_fetchhead_out : OpaquePointer? = nil
        var revert_git_oid = git_oid()
        //        let nameToIDResult = git_oid_fromstr(&revert_git_oid, "752aa0ffa6ff9cbd69fbfaa7abc7cf0408cb7244")
        
        git_annotated_commit_from_fetchhead(&git_annotated_commit_from_fetchhead_out, repo.pointer, "master", "http://52.79.235.187/git-repositories/PJY_JJANG.git", &revert_git_oid)
        
        
        git_merge(repo.pointer, &git_annotated_commit_from_fetchhead_out, 1, nil, nil)
        
    }
    
    // MARK: merge for Repo_View_Git
    public func merge_func(_ repo: Repository, remoteRepoLocation remoteRepoLocation: String, hexString: String){
        
        var git_annotated_commit_from_fetchhead_out : OpaquePointer? = nil
        var revert_git_oid = git_oid()
        let nameToIDResult = git_oid_fromstr(&revert_git_oid, hexString)
        
        git_annotated_commit_from_fetchhead(&git_annotated_commit_from_fetchhead_out, repo.pointer, "master", remoteRepoLocation, &revert_git_oid)
        
        git_merge(repo.pointer, &git_annotated_commit_from_fetchhead_out, 1, nil, nil)
    }
    
    
    // MARK: CHECKOUT
    public func checkout_branch(_ repo: Repository, branchName: String?){
        let newBranch: String = "\(branchName!)"
        
        let repository: OpaquePointer = repo.pointer
        var remote: OpaquePointer? = nil
        let result_git_remote_lookup = git_remote_lookup(&remote, repository, "origin" )
        if(result_git_remote_lookup < 0){
            // Error
        }
        
        print("new branch: \(newBranch)")
        
        let result = repo.localBranch(named: newBranch)
//        let branchResult = repo.localBranches()
        switch result {
        case .success(let branches):
            let checkoutRet = checkout(branches, strategy: .Force)
            print("checkoutrerere: \(checkoutRet)")
//            for branch in branches {
//                if(branch.name == newBranch){
//                    print("kekw")
//                    let checkoutRet = checkout(branch, strategy: .Force)
//                    print(checkoutRet)
//                    break;
//                } else {
//                    print("aabbbbbbbbb")
//                    break;
//                }
//            }
            break
        case .failure:
            print("Failed to get any branches...")
            break
        }
    }
    
    // MARK: CREATE_LOCAL_BRANCH
    public func create_localBranch(_ repo: Repository, at commit: Commit, _ branchName: String?){
        
        let newBranch: String = "\(branchName!)"
        
        let repository: OpaquePointer = repo.pointer
        var remote: OpaquePointer? = nil
        let result_git_remote_lookup = git_remote_lookup(&remote, repository, "origin" )
        if(result_git_remote_lookup < 0){
            // Error
        }
        
        /// git_object, does not exist
        let branchResult = repo.localBranches()
        switch branchResult {
        case .success(let branches):
            for branch in branches {
                if(branch.name == newBranch){
                    print("kekw")
                    let checkoutRet = checkout(branch, strategy: .Force)
                    print(checkoutRet)
                    break;
                } else {
                    //create the branch....
                    
                    var output: OpaquePointer? = nil
                    var copy = commit.oid.oid
                    var pointerToCommitInLibGit2: OpaquePointer? = nil
                    
                    let success = git_object_lookup(&pointerToCommitInLibGit2, repository, &copy, GIT_OBJECT_COMMIT)
                    
                    print(success)
                    
                    let ret = git_branch_create(&output, repository, branchName, pointerToCommitInLibGit2, 1)
                    print("kek \(ret)")
                    break;
                }
            }
            break
        case .failure:
            print("Failed to get any branches...")
            break
        }
    }
    
    
    // MARK: PUSH
    public func push(_ repo: Repository, _ username: String, _ password: String, _ branch: String? = nil){
        // todo get this properly
        
        let credentials: Credentials = Credentials.plaintext(username: username, password: password)
        var options = pushOptions(credentials: credentials)
        
        let repository: OpaquePointer = repo.pointer
        var remote: OpaquePointer? = nil
        let result_git_remote_lookup = git_remote_lookup(&remote, repository, "origin" )
        
        
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
    
    // MARK: PUSH_FORCE
    public func push_force(_ repo: Repository, _ username: String, _ password: String, _ branch: String? = nil){
        // todo get this properly
        
        let credentials: Credentials = Credentials.plaintext(username: username, password: password)
        var options = pushOptions(credentials: credentials)
        
        let repository: OpaquePointer = repo.pointer
        var remote: OpaquePointer? = nil
        let result_git_remote_lookup = git_remote_lookup(&remote, repository, "origin" )
        
        
        func localBranches() -> Result<[Branch], NSError> {
            return references(withPrefix: "refs/heads/")
                .map { (refs: [ReferenceType]) in
                    return refs.map { $0 as! Branch }
                }
        }
        
        var master: String = ""
        if(branch == nil){
            if case .success = reference(named: "refs/heads/master") {
                master = "+refs/heads/master:refs/heads/master"
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
        
        let push_result = git_remote_push(remote, &gitstr, &options)
        print(push_result)
        git_remote_free(remote)
    }
    
}
