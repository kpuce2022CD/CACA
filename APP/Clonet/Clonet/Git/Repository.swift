//
//  Repository.swift
//  Clonet
//
//  Created by 박지영 on 2022/01/22.
//

import Foundation
// import Result
import SwiftGit2
import Clibgit2
import SwiftUI
// import libgit2

let gitAuthor = Signature.init(name: "Git Writing", email: "gitwriting@example.com")

extension Repository {

    // MARK: Branch Log List
    public func branchLog(_ repo: Repository, _ branchName: String) -> [Any] {
        var Log_repo_list: [Log_repo] = []

        let result = repo.remoteBranch(named: "origin/\(branchName)")
        switch result {
        case .success(let remoteBranches):
            print("remoteBranches.commit")
            print(remoteBranches.commit.oid.description)

            var walk: OpaquePointer?
            var newWalk = git_revwalk_new(&walk, repo.pointer)
            print("newWalk", newWalk)

            var pushHead = git_revwalk_push_head(walk)
            print("pushHead", pushHead)

            var pointOut: git_oid = remoteBranches.commit.oid.oid

            while (git_revwalk_next(&pointOut, walk)) == 0 {
                // commitLook
                var commitOp: OpaquePointer?
                var commitLook = git_commit_lookup(&commitOp, repo.pointer, &pointOut)

                var commit = Commit.init(commitOp!)

                var logRepo = Log_repo.init(commitMsg: commit.message, date: String(commit.author.time.description.dropLast(5)), commitId: commit.oid.description, userId: commit.author.name)
                Log_repo_list.append(logRepo)
            }
            return Log_repo_list

            break
        case .failure:
            break
        }

        return Log_repo_list
    }

    // MARK: reset
    public func log_reset(_ repo: Repository, reset_id: String) {
        var revert_git_oid = git_oid()
        let nameToIDResult = git_oid_fromstr(&revert_git_oid, reset_id)

        //        var push_option = git_push_options()
        //        git_push_options_init(&push_option, UInt32(GIT_PUSH_OPTIONS_VERSION))

        var target: OpaquePointer?
        git_object_lookup(&target, repo.pointer, &revert_git_oid, GIT_OBJECT_COMMIT)

        git_reset(repo.pointer, target, GIT_RESET_HARD, nil)
    }

    // MARK: REVERT
    public func revert_commit(_ repo: Repository, revert_id: String) {

        var revert_git_oid = git_oid()
        let nameToIDResult = git_oid_fromstr(&revert_git_oid, revert_id)

        var git_commit_lookup_commit: OpaquePointer?
        git_commit_lookup(&git_commit_lookup_commit, repo.pointer, &revert_git_oid)

        var git_revert_option = git_revert_options()
        var options = git_revert_options_init(&git_revert_option, UInt32(GIT_REVERT_OPTIONS_VERSION))

        let result = git_revert(repo.pointer, git_commit_lookup_commit, &git_revert_option)

        print("revert_commit \(result)")

    }

    // MARK: merge
    public func merge(_ repo: Repository) {
        var revert_git_oid = git_oid()
        let nameToIDResult = git_oid_fromstr(&revert_git_oid, "f24d3d043112aa5a8ce1d1d426d1981d624b6cf0")
        print("git_oid_fromstr : ", nameToIDResult)

        var git_annotated_commit_from_fetchhead_out: OpaquePointer?
        var git_a = git_annotated_commit_from_fetchhead(&git_annotated_commit_from_fetchhead_out, repo.pointer, "FETCH_HEAD", "http://3.34.194.172/git-repositories/A.git", &revert_git_oid)
        print("git_annotated_commit_from_fetchhead : ", git_a)

        var git_m = git_merge(repo.pointer, &git_annotated_commit_from_fetchhead_out, 1, nil, nil)
        print("merge : ", git_m)

    }

    // MARK: merge for Repo_View_Git
    public func merge_func(_ repo: Repository, remoteRepoLocation remoteRepoLocation: String, hexString: String) {

        var git_annotated_commit_from_fetchhead_out: OpaquePointer?
        var revert_git_oid = git_oid()
        let nameToIDResult = git_oid_fromstr(&revert_git_oid, hexString)
        print("hexString", hexString)
        git_annotated_commit_from_fetchhead(&git_annotated_commit_from_fetchhead_out, repo.pointer, "FETCH_HEAD", remoteRepoLocation, &revert_git_oid)

        git_merge(repo.pointer, &git_annotated_commit_from_fetchhead_out, 1, nil, nil)

        git_repository_state_cleanup(repo.pointer)
    }

    // MARK: Checkout Local&Remote WITH BRANCH
    public func checkoutTOLocalBranch(_ repo: Repository, branchName: String) {

        // create the LOCAL branch....
        let result = repo.remoteBranch(named: "origin/\(branchName)")
        switch result {
        case .success(let remoteBranches):

            var output: OpaquePointer?
            var copy = remoteBranches.oid.oid
            var pointerToCommitInLibGit2: OpaquePointer?

            let success = git_object_lookup(&pointerToCommitInLibGit2, repo.pointer, &copy, GIT_OBJECT_COMMIT)

            // create
            let ret = git_branch_create(&output, repo.pointer, branchName, pointerToCommitInLibGit2, 1)

            // checkout to localBranch
            let localResult = repo.localBranch(named: branchName)
            switch localResult {
            case .success(let localBranches):

                let checkoutRet = checkout(localBranches, strategy: .Force)

                // upstream
                var branchN = "\(localBranches.name)"
                var upstreamName = "origin/\(localBranches.name)"

                // find upstream branch
                var branchOut: OpaquePointer?
                var branchLookup = git_branch_lookup(&branchOut, repo.pointer, branchN.cString(using: .utf8), GIT_BRANCH_LOCAL)
                print("branchLookup", branchLookup)

                // set local upstream to upstream
                var upstreamResult = git_branch_set_upstream(branchOut, upstreamName.cString(using: .utf8))
                print("upstreamResult", upstreamResult)

                break

            case.failure:
                break
            }

            break
        case .failure:
            print("Failed to get any branches...")
            break
        }
    }

    // MARK: CHECKOUT
    public func checkout_branch(_ repo: Repository, branchName: String?) {
        let newBranch: String = "\(branchName!)"

        let repository: OpaquePointer = repo.pointer
        var remote: OpaquePointer?
        let result_git_remote_lookup = git_remote_lookup(&remote, repository, "origin" )
        if result_git_remote_lookup < 0 {
            // Error
        }

        print("new branch: \(newBranch)")

        let result = repo.localBranch(named: newBranch)
        switch result {
        case .success(let branches):
            let checkoutRet = checkout(branches, strategy: .Force)
            print("checkoutrerere: \(checkoutRet)")

            break
        case .failure:
            print("Failed to get any branches...")
            break
        }

    }

    // MARK: CREATE_LOCAL_BRANCH
    public func create_Branch(_ repo: Repository, at commit: Commit, _ branchName: String?) {

        let repository: OpaquePointer = repo.pointer
        var remote: OpaquePointer?
        let result_git_remote_lookup = git_remote_lookup(&remote, repository, "origin" )
        if result_git_remote_lookup < 0 {
            // Error
        }

        // create the branch....

        var output: OpaquePointer?
        var copy = commit.oid.oid
        var pointerToCommitInLibGit2: OpaquePointer?

        let success = git_object_lookup(&pointerToCommitInLibGit2, repository, &copy, GIT_OBJECT_COMMIT)

        print(success)

        // create localBranch
        let ret = git_branch_create(&output, repository, branchName, pointerToCommitInLibGit2, 1)

        let checkout = checkout_branch(repo, branchName: branchName)

        // push : create RemoteBranch
        let credentials: Credentials = Credentials.plaintext(username: "ubuntu", password: "qwer1234")
        var options = pushOptions(credentials: credentials)
        func localBranches() -> Result<[Branch], NSError> {
            return references(withPrefix: "refs/heads/")
                .map { (refs: [ReferenceType]) in
                    return refs.map { $0 as! Branch }
                }
        }

        var master = "refs/heads/" + branchName!
        let strings: UnsafeMutablePointer<UnsafeMutablePointer<CChar>?> = [master].withUnsafeBufferPointer {
            let buffer = UnsafeMutablePointer<UnsafeMutablePointer<CChar>?>.allocate(capacity: $0.count + 1)
            let val = $0.map { $0.withCString(strdup) }
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

        // Checkout Local&Remote WITH BRANCH
        checkoutTOLocalBranch(repo, branchName: branchName!)

    }

    // MARK: PUSH
    public func push(_ repo: Repository, _ username: String, _ password: String, _ branch: String) {
        print("Repository Push ", branch)
        let credentials: Credentials = Credentials.plaintext(username: "ubuntu", password: "qwer1234")
        var options = pushOptions(credentials: credentials)

        let repository: OpaquePointer = repo.pointer
        var remote: OpaquePointer?
        let result_git_remote_lookup = git_remote_lookup(&remote, repository, "origin" )

        func localBranches() -> Result<[Branch], NSError> {
            return references(withPrefix: "refs/heads/")
                .map { (refs: [ReferenceType]) in
                    return refs.map { $0 as! Branch }
                }
        }

        var master = "+refs/heads/\(branch):refs/heads/\(branch)"

        let strings: UnsafeMutablePointer<UnsafeMutablePointer<CChar>?> = [master].withUnsafeBufferPointer {
            let buffer = UnsafeMutablePointer<UnsafeMutablePointer<CChar>?>.allocate(capacity: $0.count + 1)
            let val = $0.map { $0.withCString(strdup) }
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
    public func push_force(_ repo: Repository, _ username: String, _ password: String, _ branch: String) {
        // todo get this properly

        let credentials: Credentials = Credentials.plaintext(username: username, password: password)
        var options = pushOptions(credentials: credentials)

        let repository: OpaquePointer = repo.pointer
        var remote: OpaquePointer?
        let result_git_remote_lookup = git_remote_lookup(&remote, repository, "origin")

        func localBranches() -> Result<[Branch], NSError> {
            return references(withPrefix: "refs/heads/")
                .map { (refs: [ReferenceType]) in
                    return refs.map { $0 as! Branch }
                }
        }

        let master: String = "+refs/heads/\(branch):refs/heads/\(branch)"
        print(master)

        let strings: UnsafeMutablePointer<UnsafeMutablePointer<CChar>?> = [master].withUnsafeBufferPointer {
            let buffer = UnsafeMutablePointer<UnsafeMutablePointer<CChar>?>.allocate(capacity: $0.count + 1)
            let val = $0.map { $0.withCString(strdup) }
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
