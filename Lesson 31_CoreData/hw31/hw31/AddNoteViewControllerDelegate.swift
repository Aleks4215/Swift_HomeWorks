//
//  AddNoteViewControllerDelegate.swift
//  hw31
//
//  Created by Алексей on 4.10.24.
//

import Foundation

protocol AddNoteViewControllerDelegate: AnyObject {
    func didCreateNote(title: String, details: String)
    func didEditNote(note: Note)
}
