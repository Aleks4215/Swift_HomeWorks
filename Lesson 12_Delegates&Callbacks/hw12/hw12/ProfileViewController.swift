//
//  ViewController.swift
//  hw12
//
//  Created by Алексей on 11.07.24.
//

import UIKit


struct UserModel {
    var firtName: String?
    let lastName: String?
    let age: Int?
    let genger: String?
    let birthDay: Date?
    let interests: [String]?
}

class ProfileViewController: UIViewController {
    
    let editProfileViewController = EditViewController()
    
    var transferData: ((String) -> Void)?
    
    init(transferData: ((String) -> Void)? = nil) {
        self.transferData = transferData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let firstName: UILabel = {
        let label = UILabel()
        label.text = "First name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
   lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
       textField.placeholder = "Передача данных"
       textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    let changeName: UIButton = {
       let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setImage(UIImage(systemName: "more"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func EditFirstNameButtonDidTap(userModel: UserModel) {
        guard let firstName = firstNameTextField.text else { return }
        let User = UserModel(firtName: firstName, lastName: nil, age: nil, genger: nil, birthDay: nil, interests: nil)
        if let transferData {
            guard let firstName = User.firtName else { return }
            transferData(firstName)
        }
        }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(firstName)
        view.addSubview(firstNameTextField)
        view.addSubview(changeName)
    
        
        firstName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        firstName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        firstName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        firstNameTextField.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 10).isActive = true
        firstNameTextField.leadingAnchor.constraint(equalTo: firstName.leadingAnchor).isActive = true
        
        changeName.leadingAnchor.constraint(equalTo: firstNameTextField.trailingAnchor, constant: 10).isActive = true
        changeName.centerYAnchor.constraint(equalTo: firstNameTextField.centerYAnchor).isActive = true
        changeName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true

    }


}

