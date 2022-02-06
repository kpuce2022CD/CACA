//
//  ApolloGraphQLAPP.swift
//  Clonet
//
//  Created by Hye Min Choi on 2022/02/06.
//

import Foundation
import SwiftUI

@main
struct ApolloGraphQLAPP: App {
    @StateObject var launchViewModel = LaunchViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(launchViewModel)
        }
    }
}
