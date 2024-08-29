//
//  ViewController.swift
//  hw18
//
//  Created by Алексей on 17.08.24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    var topConstraint: NSLayoutConstraint?
    
    lazy var textField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Введите текст"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var textLabel: UILabel = {
       let label = UILabel()
        label.text = "Введите текст в поле ниже"
        label.textAlignment = .center
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var showTextButton: UIButton = {
       let button = UIButton()
        button.setTitle("Передать текст", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    func addSubviews(views: [UIView]) {
        views.forEach { element in
            view.addSubview(element)
        }
    }
    
    @objc func dismissKeyboard() {
        textField.resignFirstResponder()
    }
    
    @objc func buttonTapped() {
            textLabel.text = textField.text
            textLabel.textColor = .black
            textField.text = ""
            dismissKeyboard()
    }
    
    
    func setupObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                topConstraint?.constant = -keyboardSize.height / 2
            }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        topConstraint?.constant = 90
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews(views: [textField, textLabel, showTextButton])
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        topConstraint = textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 60)
        NSLayoutConstraint.activate([
            topConstraint!,
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            showTextButton.topAnchor.constraint(equalTo: textField.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            showTextButton.heightAnchor.constraint(equalToConstant: 50),
            showTextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            showTextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            showTextButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            textLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            textLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            textLabel.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -10)
        ])
        setupObservers()
    }


}

