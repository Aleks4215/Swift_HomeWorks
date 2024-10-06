//
//  AddNoteViewController.swift
//  hw31
//
//  Created by Алексей on 4.10.24.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    weak var delegate: AddNoteViewControllerDelegate?
    
    var editableNote: Note?
    
    lazy var wrapper: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            UIView(),
            titleTextField,
            descriptionTextView,
            addButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var titleTextField: UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Название заметки"
        textField.tintColor = .systemGray
        textField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        return textField
    }()
    
    lazy var descriptionTextView: UITextView = {
       let textView = UITextView()
        textView.backgroundColor = .systemGray2
        textView.layer.cornerRadius = 5
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(addButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    @objc func addButtonDidTap() {
        guard let title = titleTextField.text, let details = descriptionTextView.text else { return }

        if let note = editableNote {
            let updatedNote = Note(title: title, details: details, id: note.id)
            delegate?.didEditNote(note: updatedNote)
        } else {
            let _ = Note(title: title, details: details, id: UUID())
            delegate?.didCreateNote(title: title, details: details)
        }

        dismiss(animated: true)
    }

    
    private func validateInput() {
        let title = titleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let details = descriptionTextView.text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        addButton.isEnabled = !title.isEmpty && !details.isEmpty
    }
    
    @objc func textFieldsDidChange() {
        validateInput()
    }

    private func setupUI() {
        view.addSubview(wrapper)
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            wrapper.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            wrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            wrapper.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 150)
        ])

        if let note = editableNote {
            titleTextField.text = note.title
            descriptionTextView.text = note.details
            addButton.setTitle("Save", for: .normal)
        }
        validateInput()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension AddNoteViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        validateInput()
    }
}

