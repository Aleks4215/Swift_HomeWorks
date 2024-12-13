//
//  Homework.swift
//  hw44
//
//  Created by Алексей on 17.11.24.
//

import Foundation

struct Homework: Identifiable {
    let id = UUID().uuidString
    let title: String
    let description: String
    var rate: Double
}
