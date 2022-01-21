////
////  PushOptions.swift
////  Clonet
////
////  Created by Hye Min Choi on 2022/01/21.
////
//
//import Foundation
////import Cocoa
//@_implementationOnly import git2
//
//public class PushOptions: NSObject {
//    public typealias MessageBlock = RemoteCallback.MessageBlock
//    public typealias ProgressBlock = RemoteCallback.ProgressBlock
//
//    public var remoteCallback: RemoteCallback
//
//    public init(url: String,
//                messageBlock: MessageBlock? = nil,
//                progressBlock: ProgressBlock? = nil) {
//        self.remoteCallback = RemoteCallback(mode: .Push,
//                                             url: url,
//                                             messageBlock: messageBlock,
//                                             progressBlock: progressBlock)
//    }
//
//    func toGit() -> git_push_options {
//        let pointer = UnsafeMutablePointer<git_push_options>.allocate(capacity: 1)
//        git_push_options_init(pointer, UInt32(GIT_PUSH_OPTIONS_VERSION))
//
//        var options = pointer.move()
//
//        pointer.deallocate()
//
//        options.pb_parallelism = 0
//        options.callbacks = remoteCallback.toGit()
//        return options
//    }
//}
