//
//  DetailView.swift
//  Hacker News
//
//  Created by Aman Bind on 26/07/23.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    let title: String?

    var body: some View {
        WebView(urlString: url)
            .navigationTitle(title ?? "")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "www.google.com", title: "Google")
    }
}
