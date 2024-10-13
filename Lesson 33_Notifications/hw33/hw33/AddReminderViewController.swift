//
//  AddReminderViewController.swift
//  hw33
//
//  Created by Алексей on 10.10.24.
//

import UIKit


protocol AddReminderViewControllerDelegate: AnyObject {
    func didCreateReminder(name: String, date: Date)
}

class AddReminderViewController: UIViewController {
    
    weak var delegate: AddReminderViewControllerDelegate?

    lazy var wrapper: UIStackView = {
       let wrapper = UIStackView(arrangedSubviews: [
        reminderNameTextField,
        datePicker,
        saveButton
       ])
        wrapper.axis = .vertical
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        return wrapper
    }()
    
    lazy var reminderNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя друга"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    
    lazy var datePicker: UIDatePicker = {
          let datePicker = UIDatePicker()
          datePicker.minimumDate = .now
          datePicker.datePickerMode = .dateAndTime
          datePicker.preferredDatePickerStyle = .wheels
          datePicker.translatesAutoresizingMaskIntoConstraints = false
          return datePicker
      }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сохранить", for: .normal)
        button.addTarget(self, action: #selector(saveButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    @objc func saveButtonDidTap() {
        guard let reminderName = reminderNameTextField.text, !reminderName.isEmpty else { return }
        let reminderDate = datePicker.date
        delegate?.didCreateReminder(name: reminderName, date: reminderDate)
        dismiss(animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(wrapper)
        
        NSLayoutConstraint.activate([
            wrapper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            wrapper.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            wrapper.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            wrapper.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
