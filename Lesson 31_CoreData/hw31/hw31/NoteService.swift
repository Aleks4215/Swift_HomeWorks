//
//  NoteService.swift
//  hw31
//
//  Created by Алексей on 4.10.24.
//

import Foundation
import CoreData
import UIKit

class CoreDataStorage: NotesStorage {
    
    var appDelegate: AppDelegate? {
        UIApplication.shared.delegate as? AppDelegate
    }
    
    var context: NSManagedObjectContext? {
        appDelegate?.persistentContainer.viewContext
    }
    
    func add(note: Note) {
        guard let context = context else { return }
        
        let entity = NSEntityDescription.entity(forEntityName: "NoteModel", in: context)!
        let newNote = NSManagedObject(entity: entity, insertInto: context)
        
        newNote.setValue(UUID(), forKey: "id")
        newNote.setValue(note.title, forKey: "title")
        newNote.setValue(note.details, forKey: "details")
        
        do {
            try context.save()
        } catch {
            print("error \(error.localizedDescription)")
        }
    }
    
    func read() -> [Note] {
        guard let context = context else { return [] }
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "NoteModel")
        
        do {
            let fetchedNotes = try context.fetch(fetchRequest)
            return fetchedNotes.map { noteEntity in
                let id = noteEntity.value(forKey: "id") as! UUID
                let title = noteEntity.value(forKey: "title") as! String
                let details = noteEntity.value(forKey: "details") as! String
                return Note(title: title, details: details, id: id)
            }
        } catch {
            print("error: \(error.localizedDescription)")
            return []
        }
    }
    
    func delete(note: Note) {
        guard let context = context else { return }
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "NoteModel")
        fetchRequest.predicate = NSPredicate(format: "id == %@", note.id as CVarArg)
        
        do {
            let fetchedNotes = try context.fetch(fetchRequest)
            if let noteToDelete = fetchedNotes.first {
                context.delete(noteToDelete)
                try context.save()
            }
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
    
    func edit(note: Note) {
        guard let context = context else { return }

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "NoteModel")
        fetchRequest.predicate = NSPredicate(format: "id == %@", note.id as CVarArg)

        do {
            let fetchedNotes = try context.fetch(fetchRequest)
            if let noteToEdit = fetchedNotes.first {
                noteToEdit.setValue(note.title, forKey: "title")
                noteToEdit.setValue(note.details, forKey: "details")
                try context.save()
            }
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
}

