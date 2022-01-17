//
//  WKWebView+Extensions.swift
//  HackerNews
//
//  Created by Matthew Fraser on 2022-01-16.
//

import Foundation
import WebKit

extension WKWebView {

    static func pageNotfound() -> WKWebView {
        let wk = WKWebView()
        wk.loadHTMLString("<html><body><h1>Page Not Found!</h1></body></html>", baseURL: nil)
        return wk
    }
}
