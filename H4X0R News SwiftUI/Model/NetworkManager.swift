//
//  NetworkManager.swift
//  H4X0R News SwiftUI
//
//  Created by Inna Kokorina on 03.03.2022.
//

import Foundation

class NetworkManager : ObservableObject{
   @Published var posts = [Post]()
    
    func fetchData() {
        if  let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                           let results =  try decoder.decode(PostData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                          
                        } catch {
                            print("error in parsing")
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

