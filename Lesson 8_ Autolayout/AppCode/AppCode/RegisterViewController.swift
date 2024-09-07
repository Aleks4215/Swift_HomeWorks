//
//  RegisterViewController.swift
//  AppCode
//
//  Created by Алексей on 29.06.24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let container: UIView = {
        let container = UIView()
        container.backgroundColor = .clear
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private let titleScreen: UILabel = {
        let label = UILabel()
        label.text = "Registration Form"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.font = .systemFont(ofSize: 23)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please enter username"
        textField.backgroundColor = .white
        textField.tintColor = .systemBlue
        textField.borderStyle = .roundedRect
        textField.autoresizesSubviews = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please enter password"
        textField.backgroundColor = .white
        textField.tintColor = .systemBlue
        textField.borderStyle = .roundedRect
        textField.autoresizesSubviews = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Confirm password"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please confirm password"
        textField.backgroundColor = .white
        textField.tintColor = .systemBlue
        textField.borderStyle = .roundedRect
        textField.autoresizesSubviews = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let saveBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Save", for: .normal)
        btn.backgroundColor = .gray
        btn.tintColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupСontainer() {
        view.addSubview(container)
        view.backgroundColor = .systemPink
        container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        container.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        container.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setupUI() {
        setupСontainer()
        container.addSubview(titleScreen)
        container.addSubview(userNameLabel)
        container.addSubview(usernameTextField)
        container.addSubview(passwordLabel)
        container.addSubview(passwordTextField)
        container.addSubview(confirmPasswordLabel)
        container.addSubview(confirmPasswordTextField)
        container.addSubview(saveBtn)
        
        titleScreen.topAnchor.constraint(equalTo: container.topAnchor, constant: 20).isActive = true
        titleScreen.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 30).isActive = true
        titleScreen.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30).isActive = true
        
        userNameLabel.topAnchor.constraint(equalTo: titleScreen.bottomAnchor, constant: 10).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: titleScreen.leadingAnchor, constant: 20).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: titleScreen.trailingAnchor).isActive = true
        
        usernameTextField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10).isActive = true
        usernameTextField.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor).isActive = true
        usernameTextField.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor).isActive = true
        
        passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor).isActive = true
        passwordLabel.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: passwordLabel.trailingAnchor).isActive = true
        
        confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 10).isActive = true
        confirmPasswordLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        confirmPasswordLabel.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        
        confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 10).isActive = true
        confirmPasswordTextField.leadingAnchor.constraint(equalTo: confirmPasswordLabel.leadingAnchor).isActive = true
        confirmPasswordTextField.trailingAnchor.constraint(equalTo: confirmPasswordLabel.trailingAnchor).isActive = true
        
        saveBtn.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 10).isActive = true
        saveBtn.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        saveBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        saveBtn.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
