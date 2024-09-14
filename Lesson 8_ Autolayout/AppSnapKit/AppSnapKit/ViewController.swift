//
//  ViewController.swift
//  AppSnapKit
//
//  Created by Алексей on 29.06.24.
//

import UIKit
import SnapKit

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
        container.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
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
        
        titleScreen.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(container.snp.centerX)
            make.top.equalTo(container.snp.top).offset(20)
        }
        
        userNameLabel.snp.makeConstraints {(make) -> Void in
            make.top.equalTo(titleScreen.snp.top).offset(20)
            make.leading.equalTo(container.snp.leading).offset(15)
            make.trailing.equalTo(container.snp.trailing).offset(-15)
        }
        
        usernameTextField.snp.makeConstraints {(make) -> Void in
            make.top.equalTo(userNameLabel.snp.bottom).offset(20)
            make.leading.equalTo(userNameLabel.snp.leading)
            make.trailing.equalTo(userNameLabel.snp.trailing)
        }
        
        passwordLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.leading.equalTo(usernameTextField.snp.leading)
            make.trailing.equalTo(usernameTextField.snp.trailing)
        }
        
        passwordTextField.snp.makeConstraints {(make) -> Void in
            make.top.equalTo(passwordLabel.snp.bottom).offset(20)
            make.leading.equalTo(passwordLabel.snp.leading)
            make.trailing.equalTo(passwordLabel.snp.trailing)
        }
        
        loginBth.snp.makeConstraints {(make) -> Void in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.centerX.equalTo(titleScreen.snp.centerX)
            make.width.equalTo(90)
            make.height.equalTo(44)
        }
        
        registerLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(loginBth.snp.centerX)
            make.top.equalTo(loginBth.snp.bottom).offset(25)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


}

