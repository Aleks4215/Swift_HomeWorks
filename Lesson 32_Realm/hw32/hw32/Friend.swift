//
//  Friend.swift
//  hw32
//
//  Created by Алексей on 6.10.24.
//

import Foundation
import RealmSwift

class Friend: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var firstName: String
    @Persisted var lastName: String
}
