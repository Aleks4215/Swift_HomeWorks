//
//  AddTaskViewController.swift
//  hw40
//
//  Created by Алексей on 22.11.24.
//

import UIKit
import FirebaseFirestore

class AddTaskViewController: UIViewController {
    
    private let textField: UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter task"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveTask), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let db = Firestore.firestore()
    var taskAddedCallback: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "Add Task"
        view.addSubview(textField)
        view.addSubview(saveButton)

        NSLayoutConstraint.activate([
            textField.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textField.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),

            saveButton.safeAreaLayoutGuide.topAnchor.constraint(equalTo: textField.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            saveButton.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }

    @objc private func saveTask() {
        guard let task = textField.text, !task.isEmpty else { return }
        db.collection("tasks").addDocument(data: ["title": task]) { [weak self] error in
            if let error = error {
                print("Error saving task: \(error)")
                return
            }

            self?.taskAddedCallback?()
            self?.navigationController?.popViewController(animated: true)
        }
    }
}

