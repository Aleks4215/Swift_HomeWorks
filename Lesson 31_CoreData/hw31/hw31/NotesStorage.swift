//
//  NotesStorage.swift
//  hw31
//
//  Created by Алексей on 4.10.24.
//

import Foundation

protocol NotesStorage {
    func add(note: Note)
    func read() -> [Note]
    func delete(note: Note)
    func edit(note: Note)
}
