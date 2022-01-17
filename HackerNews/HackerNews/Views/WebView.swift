//
//  WebView.swift
//  HackerNews
//
//  Created by Matthew Fraser on 2022-01-16.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView

    var url: String

    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView.pageNotfound()
        }

        let request = URLRequest(url: url)
        let wkWebView = WKWebView()

        wkWebView.load(request)

        return wkWebView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: self.url) else {
            return
        }

        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
