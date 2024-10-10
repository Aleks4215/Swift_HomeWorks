//
//  AddFriendViewController.swift
//  hw32
//
//  Created by Алексей on 6.10.24.
//

import UIKit

class AddFriendViewController: UIViewController {
    
    var friendToEdit: Friend?
    
    lazy var wrapper: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [
        
        firstNameTextField,
        lastNameTextField,
        saveButton
       ])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textField.borderStyle = .roundedRect
        textField.placeholder = "First name"
        return textField
    }()
    
    lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textField.borderStyle = .roundedRect
        textField.placeholder = "Last name"
        return textField
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.addTarget(self, action: #selector(saveButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        if let friend = friendToEdit {
            firstNameTextField.text = friend.firstName
            lastNameTextField.text = friend.lastName
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(wrapper)
        
        NSLayoutConstraint.activate([
            wrapper.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            wrapper.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            wrapper.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            wrapper.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc func saveButtonDidTap() {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        
        if let friend = friendToEdit {
            RealmManager.shared.update(friend: friend, firstName: firstName, lastName: lastName)
        } else {
            let newFriend = Friend()
            newFriend.firstName = firstName
            newFriend.lastName = lastName
            RealmManager.shared.add(friend: newFriend)
        }
        navigationController?.popViewController(animated: true)
    }
}

