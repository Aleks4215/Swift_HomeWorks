//
//  Student.swift
//  hw44
//
//  Created by Алексей on 17.11.24.
//

import Foundation

struct Student: Identifiable {
    let id = UUID().uuidString
    let firstName: String
    let lastName: String
    var homeworks: [Homework]
}
