//
//  ContentView.swift
//  Hacker News
//
//  Created by Aman Bind on 26/07/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                
                NavigationLink(destination: DetailView(url: post.url, title: post.title)) {
                    HStack {
                        VStack {
                            Text("\(post.points)")
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                            
                            Text("Upvotes")
                                .font(.footnote)
                                .font(.system(size: 10))
                                .foregroundColor(.primary)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(post.title)
                                .font(.headline)
                                .padding(1)
                            
                            HStack {
                                HStack{
                                    Text("by")
                                        .font(.system(size: 10))
                                        .foregroundColor(.secondary)
                                        
                                    Text("_\(post.author)_")
                                        .font(.system(size: 10))
                                        .fontWeight(.bold)
                                        .foregroundColor(.secondary)
                                        .frame(width: 90, alignment: .leading)
                                        .offset(x:-5)
                                    
                                }
                                HStack {
                                    Image(systemName: "clock.fill")
                                        .foregroundColor(.orange)
                                        .imageScale(.small)
                                    
                                    Spacer(minLength: 2)
                                    
                                    Text("\(post.date_time)")
                                        .foregroundStyle(.secondary)
                                        .font(.system(size: 10))
                                        
                                }
                                
                                
                            }
                        }
                    }
                    
                }
                
                
            }
            
            
            .navigationBarTitle("Hacker News ")
        }.onAppear {
            networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
