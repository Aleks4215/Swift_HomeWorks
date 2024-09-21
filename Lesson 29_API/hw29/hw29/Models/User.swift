//
//  User.swift
//  hw29
//
//  Created by Алексей on 19.09.24.
//

import Foundation

struct User: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

struct Company: Codable {
    let name, catchPhrase, bs: String
}

struct Geo: Codable {
    let lat, lng: String
}
