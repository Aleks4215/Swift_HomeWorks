//
//  Photo.swift
//  hw29
//
//  Created by Алексей on 19.09.24.
//

import Foundation

struct Photo: Codable {
    let title, url, thumbnailUrl: String
    let albumId, id: Int
}
