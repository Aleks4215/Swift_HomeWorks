//
//  EditViewController.swift
//  hw12
//
//  Created by Алексей on 11.07.24.
//

import UIKit


protocol EditDelegate: AnyObject {
    func didSelectDate(date: Date)
    func didSelectGender(gender: String)
}

class EditViewController: UIViewController {
    
    var isHiddenIntereses = true
    var transferData: ((String) -> Void)?
    var transferIntereses: (([String]) -> Void)?
    var delegate: EditDelegate?
    
    init(transferData: ((String) -> Void)? = nil) {
        self.transferData = transferData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let editTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Передача данных"
        textField.backgroundColor = .white
        textField.tintColor = .systemBlue
        textField.borderStyle = .roundedRect
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.maximumDate = Date()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.isHidden = true
        return picker
    }()
    
    let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.insertSegment(withTitle: "М", at: 0, animated: true)
        control.insertSegment(withTitle: "Ж", at: 1, animated: true)
        control.isHidden = true
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        return button
    }()
    
    let saveDateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveDate), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    let saveGenderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveGender), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    var recivedText: String?
    
    private func handleInterses() {
        if !isHiddenIntereses {
            let interesesVC = InteresesCollectionViewController()
            view.addSubview(interesesVC)
            interesesVC.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
            interesesVC.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
            interesesVC.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        }
    }
    
    @objc func save() {
        if let text = editTextField.text {
            transferData?(text)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func saveDate() {
        delegate?.didSelectDate(date: datePicker.date)
        self.dismiss(animated: true)
    }
    
    @objc func saveGender() {
        let index = segmentedControl.selectedSegmentIndex
        guard let gender = segmentedControl.titleForSegment(at: index) else { return }
        delegate?.didSelectGender(gender: gender)
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleInterses()
        view.backgroundColor = .white
        view.addSubview(editTextField)
        view.addSubview(saveButton)
        view.addSubview(datePicker)
        view.addSubview(saveDateButton)
        view.addSubview(segmentedControl)
        view.addSubview(saveGenderButton)
        
        editTextField.text = recivedText
        editTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        editTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        editTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        
        saveButton.topAnchor.constraint(equalTo: editTextField.bottomAnchor, constant: 15).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        saveDateButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20).isActive = true
        saveDateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        segmentedControl.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        saveGenderButton.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20).isActive = true
        saveGenderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        if let genderText = recivedText {
            segmentedControl.selectedSegmentIndex = indexOfSegment(withTitle: genderText)
        }
    }
    func indexOfSegment(withTitle title: String) -> Int {
        for index in 0..<segmentedControl.numberOfSegments {
            if segmentedControl.titleForSegment(at: index) == title {
                return index
            }
        }
        return UISegmentedControl.noSegment
    }
}

