//
//  PostData.swift
//  H4X0R News SwiftUI
//
//  Created by Inna Kokorina on 03.03.2022.
//

import Foundation
struct PostData: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let title: String
    let points: Int
    let url: String?
    let objectID: String
}
