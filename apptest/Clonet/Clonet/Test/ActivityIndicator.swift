//
//  ActivityIndicator.swift
//  Clonet
//
//  Created by Jimin on 2022/01/12.
//

import UIKit
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
//    typealias UIViewType = UIActivityIndicatorView
    var style: UIActivityIndicatorView.Style
    var isLoading: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isLoading ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
}
