//
//  RegisterViewController.swift
//  AppSnapKit
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
        container.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
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
        container.addSubview(confirmPasswordLabel)
        container.addSubview(confirmPasswordTextField)
        container.addSubview(saveBtn)
        
        titleScreen.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(container.snp.top).offset(20)
            make.leading.equalTo(container.snp.leading).offset(30)
            make.trailing.equalTo(container.snp.trailing).offset(-30)
        }
        
        userNameLabel.snp.makeConstraints {(make) -> Void in
            make.top.equalTo(titleScreen.snp.bottom).offset(10)
            make.leading.equalTo(titleScreen.snp.leading).offset(20)
            make.trailing.equalTo(titleScreen.snp.trailing)
        }
        
        usernameTextField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(userNameLabel.snp.bottom).offset(10)
            make.leading.equalTo(userNameLabel.snp.leading)
            make.trailing.equalTo(userNameLabel.snp.trailing)
        }
        
        passwordLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(usernameTextField.snp.bottom).offset(10)
            make.leading.equalTo(usernameTextField.snp.leading)
            make.trailing.equalTo(usernameTextField.snp.trailing)
        }
        
        passwordTextField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(passwordLabel.snp.bottom).offset(10)
            make.leading.equalTo(passwordLabel.snp.leading)
            make.trailing.equalTo(passwordLabel.snp.trailing)
        }
        
        confirmPasswordLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.leading.equalTo(passwordTextField.snp.leading)
            make.trailing.equalTo(passwordTextField.snp.trailing)
        }
        
        confirmPasswordTextField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(confirmPasswordLabel.snp.bottom).offset(10)
            make.leading.equalTo(confirmPasswordLabel.snp.leading)
            make.trailing.equalTo(confirmPasswordLabel.snp.trailing)
        }
        
        saveBtn.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(10)
            make.centerX.equalTo(container.snp.centerX)
            make.width.equalTo(70)
            make.height.equalTo(44)
        }
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
