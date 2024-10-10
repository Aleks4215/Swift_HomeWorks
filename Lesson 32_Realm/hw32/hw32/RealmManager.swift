//
//  RealmManager.swift
//  hw32
//
//  Created by Алексей on 6.10.24.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    init() { }
    
    var realm: Realm {
        try! Realm()
    }
    
    func add(friend: Friend) {
        do {
            try realm.write {
                realm.add(friend)
            }
        } catch {
            print("Ошибка добавления друга: \(error)")
        }
    }
    
    func delete(friend: Friend) {
        do {
            try realm.write {
                realm.delete(friend)
            }
        } catch {
            print("Ошибка удаления друга: \(error)")
        }
    }
    
    func update(friend: Friend, firstName: String, lastName: String) {
        do {
            try realm.write {
                friend.firstName = firstName
                friend.lastName = lastName
            }
        } catch {
            print("Ошибка обновления друга: \(error)")
        }
    }
    
    func read() -> Results<Friend> {
          return realm.objects(Friend.self)
      }
    
    func loadAndObserveFriends(onChange: @escaping (RealmCollectionChange<Results<Friend>>) -> Void) -> NotificationToken {
           let friends = read().sorted(byKeyPath: "firstName", ascending: true)
           let token = friends.observe { changes in
               onChange(changes)
           }
           return token
       }
}

