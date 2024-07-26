//
//  EditViewController.swift
//  hw12
//
//  Created by Алексей on 11.07.24.
//

import UIKit

class EditViewController: UINavigationController {
    
    let firstName: UILabel = {
        let label = UILabel()
        label.text = "First name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
   let firstNameTextField: UITextField = {
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
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
