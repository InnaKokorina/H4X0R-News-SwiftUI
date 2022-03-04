//
//  ContentView.swift
//  H4X0R News SwiftUI
//
//  Created by Inna Kokorina on 03.03.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                HStack {
                    Text(String(post.points))
                    Text(post.title)
                }

                     }
            .navigationTitle("H4X0R NEWS")
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




