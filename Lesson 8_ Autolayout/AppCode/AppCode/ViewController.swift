//
//  ViewController.swift
//  AppCode
//
//  Created by Алексей on 29.06.24.
//

import UIKit

class ViewController: UIViewController {
    
    private let container: UIView = {
        let container = UIView()
        container.backgroundColor = .clear
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private let titleScreen: UILabel = {
        let label = UILabel()
        label.text = "My Home Control"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .black
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
        label.textColor = .black
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
    
    private let loginBth: UIButton = {
        let btn = UIButton()
        btn.setTitle("Log In", for: .normal)
        btn.backgroundColor = .gray
        btn.tintColor = .blue
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Register"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func setupСontainer() {
        view.addSubview(container)
        view.backgroundColor = .blue
        container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    
    func setupUI() {
        setupСontainer()
        container.addSubview(titleScreen)
        container.addSubview(userNameLabel)
        container.addSubview(usernameTextField)
        container.addSubview(passwordLabel)
        container.addSubview(passwordTextField)
        container.addSubview(loginBth)
        container.addSubview(registerLabel)
        
        titleScreen.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        titleScreen.topAnchor.constraint(equalTo: container.topAnchor, constant: 20).isActive = true
        
        userNameLabel.topAnchor.constraint(equalTo: titleScreen.bottomAnchor, constant: 20).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 15).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 15).isActive = true
        
        usernameTextField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 20).isActive = true
        usernameTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 15).isActive = true
        usernameTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15).isActive = true
        
        passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 15).isActive = true
        passwordLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 15).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 15).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15).isActive = true
        
        loginBth.centerXAnchor.constraint(equalTo: titleScreen.centerXAnchor).isActive = true
        loginBth.widthAnchor.constraint(equalToConstant: 90).isActive = true
        loginBth.heightAnchor.constraint(equalToConstant: 44).isActive = true
        loginBth.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 35).isActive = true
        
        registerLabel.centerXAnchor.constraint(equalTo: loginBth.centerXAnchor).isActive = true
        registerLabel.topAnchor.constraint(equalTo: loginBth.bottomAnchor, constant: 25).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


}

