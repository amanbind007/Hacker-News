//
//  WebView.swift
//  Hacker News
//
//  Created by Aman Bind on 27/01/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String?

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = urlString {
            if let url = URL(string: safeUrl) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}

struct WebView_Preview: PreviewProvider {
    static var previews: some View {
        WebView(urlString: "www.google.com")
    }
}
