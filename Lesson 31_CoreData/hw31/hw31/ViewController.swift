//
//  ViewController.swift
//  hw31
//
//  Created by Алексей on 4.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    var notes: [Note] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    let storage: NotesStorage = CoreDataStorage()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "noteCell")
        return tableView
    }()
    
    lazy var addButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        button.tintColor = .systemBlue
        return button
    }()
    
    @objc func addButtonTapped() {
        let addNoteVC = AddNoteViewController()
        addNoteVC.modalPresentationStyle = .pageSheet
        addNoteVC.sheetPresentationController?.detents = [.medium()]
        addNoteVC.delegate = self
        present(addNoteVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = addButton
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
            notes = storage.read()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell") else { return UITableViewCell() }
        
        var config = UIListContentConfiguration.cell()
        config.text = notes[indexPath.row].title
        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
           let editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] (action, view, completionHandler) in
               guard let self = self else { return }
               let noteToEdit = self.notes[indexPath.row]
               let editNoteVC = AddNoteViewController()
               editNoteVC.modalPresentationStyle = .pageSheet
               editNoteVC.sheetPresentationController?.detents = [.medium()]
               editNoteVC.delegate = self
               editNoteVC.editableNote = noteToEdit
               self.present(editNoteVC, animated: true)
               completionHandler(true)
           }
           editAction.backgroundColor = .systemBlue
           
           let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
               guard let self = self else { return }
               let noteToDelete = self.notes[indexPath.row]
               self.storage.delete(note: noteToDelete)
               self.notes = self.storage.read()
               completionHandler(true)
           }
           
           let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
           swipeActions.performsFirstActionWithFullSwipe = false
           return swipeActions
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          let selectedNote = notes[indexPath.row]
          
          let viewNoteVC = DetailsNoteViewController()
          viewNoteVC.note = selectedNote
          viewNoteVC.modalPresentationStyle = .pageSheet
          viewNoteVC.sheetPresentationController?.detents = [.medium()]
          
          present(viewNoteVC, animated: true)
          
          tableView.deselectRow(at: indexPath, animated: true)
      }
}

extension ViewController: AddNoteViewControllerDelegate {
    func didEditNote(note: Note) {
        storage.edit(note: note)
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index] = note
        }
    }
    
    func didCreateNote(title: String, details: String) {
        let newNote = Note(title: title, details: details, id: UUID())
        storage.add(note: newNote)
        notes = storage.read()
    }
}


