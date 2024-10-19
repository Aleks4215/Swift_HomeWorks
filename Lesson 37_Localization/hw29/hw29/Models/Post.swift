//
//  Post.swift
//  hw29
//
//  Created by Алексей on 19.09.24.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int?
    let title, body: String
}

