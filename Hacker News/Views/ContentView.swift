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
        NavigationView{


            List(networkManager.posts){ (post) in
                
                NavigationLink(destination: DetailView(url: post.url)) {
                    
                    HStack{
                        VStack{
                            Text("\(post.points)")
                                .foregroundColor(.green)
                            
                            Text("Upvotes")
                                .font(.system(size: 10))
                                .foregroundColor(.indigo)
                            
                        }
                        
                        VStack(alignment: .leading){
                            Text(post.title)
                                .padding(1)
                            
                            
                            HStack{
                                Text("by \(post.author)")
                                    .font(.system(size: 10))
                                    .foregroundColor(.teal)
                                    .frame(width: 90, alignment: .leading)
                                    
                                
                                
                                
                                HStack(alignment: .center){
                                    Image(systemName: "clock")
                                        .foregroundColor(.orange)
                                    
                                    
                                    
                                    
                                    Text("\(post.date_time)")
                                        .font(.system(size: 10))
                                }
                                
                                
                            }
                        }
                        

                    }
                    
                }
                
                
               
            }
            
            
            
            .navigationBarTitle("Hacker News ")
        }.onAppear{
            networkManager.fetchData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




//let posts = [
//    Post(id: "11", title: "Hello World"),
//    Post(id: "11", title: "Bye, World"),
//    Post(id: "13", title: "Hi, World")
//]
