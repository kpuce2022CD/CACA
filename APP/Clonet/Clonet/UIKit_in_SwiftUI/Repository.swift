
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
    
    
    //MARK: REVERT
    public func revert_commit(_ repo: Repository){
        
        var revert_git_oid = git_oid()
        let nameToIDResult = git_oid_fromstr(&revert_git_oid, "44af94469519000ea2ba4722f9156fc562e2ce36")
        
        var git_commit_lookup_commit : OpaquePointer? = nil
        git_commit_lookup(&git_commit_lookup_commit, repo.pointer, &revert_git_oid)

        let result = git_revert(repo.pointer, git_commit_lookup_commit, nil)

    }
    
    
    
    
    
    
//    //MARK: MERGE
//    public func merge(_ repo: Repository, _ commit: Commit, _ remote : Remote) -> String{
//////        Branch.init(repo.pointer)?.oid
////////        var mergeResult = git_diff_merge(repo.pointer, repo.pointer) // from = fetch_head
////////
////////
////        let branch_name : UnsafePointer = UnsafePointer<CChar>("FETCH_HEAD")
////
////
////        git_annotated_commit_from_fetchhead(git_annotated_commit_id(repo.pointer), repo.pointer, branch_name, remote.URL, <#T##id: UnsafePointer<git_oid>!##UnsafePointer<git_oid>!#>)
////
////
////
////
////
//////        let their_heads = UnsafeMutablePointer<OpaquePointer?>(repo.pointer)
//////        let merge_opts : UnsafePointer = UnsafePointer<git_merge_options>.init(repo.pointer)
//////        let checkout_opts : UnsafePointer = UnsafePointer<git_checkout_options>.init(repo.pointer)
////////        let merge_result = git_merge(repo.pointer, their_heads, 1, merge_opts, checkout_opts)
//////
//////
////////        git_merge(<#T##repo: OpaquePointer!##OpaquePointer!#>, <#T##their_heads: UnsafeMutablePointer<OpaquePointer?>!##UnsafeMutablePointer<OpaquePointer?>!#>, <#T##their_heads_len: Int##Int#>, <#T##merge_opts: UnsafePointer<git_merge_options>!##UnsafePointer<git_merge_options>!#>, <#T##checkout_opts: UnsafePointer<git_checkout_options>!##UnsafePointer<git_checkout_options>!#>)
//        ///
//        ///
//        ///
//        ///
//        ///
//        ///
//        ///
//
////        var fetchhead_commit : git_annotated_commit
////        var get_oid = git_annotated_commit_id(repo.pointer)
////        git_annotated_commit_lookup(<#T##out: UnsafeMutablePointer<OpaquePointer?>!##UnsafeMutablePointer<OpaquePointer?>?#>, repo.pointer, get_oid)
//
//        // 1
//        git_remote_fetch(repo.pointer, nil, nil, "fetch!")
//
//        // 2
//        var out_o = repo.pointer
//        var out : UnsafeMutablePointer = UnsafeMutablePointer<OpaquePointer?>.init(out_o)
//        var remote_url = "http://52.79.235.187/git-repositories/PJY_JJANG.git"
//        var get_oid = git_annotated_commit_id(repo.pointer)
//
//        git_annotated_commit_from_fetchhead(out, repo.pointer, "FETCH_HEAD", remote_url, get_oid)
//
//        // 3
//        let merge_opts : UnsafePointer = UnsafePointer<git_merge_options>.init(repo.pointer)
//        let checkout_opts : UnsafePointer = UnsafePointer<git_checkout_options>.init(repo.pointer)
//        git_merge(repo.pointer, out, 1, merge_opts, checkout_opts)
//
//        // 4
//        var id = git_oid()
//        var sig = UnsafeMutablePointer<UnsafeMutablePointer<git_signature>?>.allocate(capacity: 1)
//
//        var tree_id = git_oid()
//        let oid = OID(tree_id)
//        let tree = treeLookup(oid: oid)
//
//        let error = git_commit_create(&id, repo.pointer, "HEAD", sig.pointee, sig.pointee, "UTF-8", "MERGE MESSAGE", <#T##tree: OpaquePointer!##OpaquePointer!#>, <#T##parent_count: Int##Int#>, <#T##parents: UnsafeMutablePointer<OpaquePointer?>!##UnsafeMutablePointer<OpaquePointer?>!#>)
//
//
//
//        return "\("merge_result")"
//    }
//
//    public func treeLookup(oid tree_id: OID) throws -> Tree {
//
//        // Create tree
//        let tree : UnsafeMutablePointer<OpaquePointer?> = UnsafeMutablePointer<OpaquePointer?>.allocate(capacity: 1)
//
//        var oid = tree_id.oid
//        let error = git_tree_lookup(tree, pointer.pointee, &oid)
////        if (error != 0) {
////
////            tree.deinitialize()
////            tree.deallocate(capacity: 1)
////
////            throw gitUnknownError("Unable to lookup tree", code: error)
////        }
//
//        return Tree(repository: self, tree: tree)
//    }

    
    // MARK: CHECKOUT
    public func checkout_branch(_ repo: Repository, branchName: String?){
        let newBranch: String = "\(branchName!)"

        let repository: OpaquePointer = repo.pointer
        var remote: OpaquePointer? = nil
        let result_git_remote_lookup = git_remote_lookup(&remote, repository, "origin" )
        if(result_git_remote_lookup < 0){
            // Error
        }

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
                    break;
                }
            }
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
//        let branchResult = repo.remoteBranches()
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
//                    let checkoutRet = checkout(branch, strategy: .Force)
//                    print(checkoutRet)
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

}
