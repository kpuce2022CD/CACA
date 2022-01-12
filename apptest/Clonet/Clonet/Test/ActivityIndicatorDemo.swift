//
//  ActivityIndicatorDemo.swift
//  Clonet
//
//  Created by Jimin on 2022/01/12.
//

import SwiftUI

struct ActivityIndicatorDemo: View {
    @State private var isLoading = false
    
    var body: some View {
        VStack{
            ActivityIndicator(
                style: .large,
                isLoading: isLoading
            )
                .padding()
            Button(
                action: { isLoading.toggle() },
                label: {
                    Text("Change Value")
                        .padding(20)
                        .background(Color.blue)
                        .foregroundColor(.white)
                    
                }
            )
        }
    }
}

struct ActivityIndicatorDemo_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorDemo()
    }
}
