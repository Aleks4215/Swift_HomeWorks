//
//  ViewController.swift
//  hw12
//
//  Created by Алексей on 11.07.24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let interesesCollectionView = InteresesCollectionViewController()
    
    let vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var firstName: UILabel = {
        let label = UILabel()
        label.text = "Введите ваше имя"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var editFirstName: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "highlighter"), for: .normal)
        button.addTarget(self, action: #selector(editFirstNameButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    var lastName: UILabel = {
        let label = UILabel()
        label.text = "Фамилия"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var editLastName: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "highlighter"), for: .normal)
        button.addTarget(self, action: #selector(editLastNameButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Возраст"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var editAge: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "highlighter"), for: .normal)
        button.addTarget(self, action: #selector(editAgeButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    var gender: UILabel = {
        let label = UILabel()
        label.text = "Пол"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var editGender: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "highlighter"), for: .normal)
        button.addTarget(self, action: #selector(editGenderButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    var birthayDay: UILabel = {
        let label = UILabel()
        label.text = "День рождения"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let intereses: UILabel = {
        let label = UILabel()
        label.text = "Интересы"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let editIntereses: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "highlighter"), for: .normal)
        button.addTarget(self, action: #selector(editEnteresesButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    var editBirthDayButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "highlighter"), for: .normal)
        button.addTarget(self, action: #selector(editAgeButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    @objc func editEnteresesButtonDidTap() {
        let edicVC = EditViewController()
        edicVC.isHiddenIntereses = false
        edicVC.saveButton.isHidden = true
        edicVC.editTextField.isHidden = true
        self.present(edicVC, animated: true)
    }
        
    @objc func editFirstNameButtonDidTap() {
        let editVC = EditViewController()
        editVC.recivedText = self.firstName.text
        editVC.transferData = { [weak self] text in
            self?.firstName.text = text
        }
        self.present(editVC, animated: true, completion: nil)
    }
    
    @objc func editLastNameButtonDidTap() {
        let editVC = EditViewController()
        editVC.recivedText = self.lastName.text
        editVC.transferData = { [weak self] text in
            self?.lastName.text = text
        }
        self.present(editVC, animated: true, completion: nil)
    }
    
    func getDateFromLabel() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        if let dateString = birthayDay.text?.replacingOccurrences(of: "День рождения ", with: ""),
           let date = dateFormatter.date(from: dateString) {
            return date
        }
        return Date()
    }
    
    @objc func editAgeButtonDidTap() {
        let editVC = EditViewController()
        editVC.delegate = self
        editVC.datePicker.isHidden = false
        editVC.saveButton.isHidden = true
        editVC.editTextField.isHidden = true
        editVC.saveDateButton.isHidden = false
        editVC.datePicker.date = getDateFromLabel()
        self.present(editVC, animated: true)
    }
    
    @objc func editGenderButtonDidTap() {
        let editVC = EditViewController()
        editVC.recivedText = self.gender.text
        editVC.delegate = self
        editVC.saveGenderButton.isHidden = false
        editVC.saveButton.isHidden = true
        editVC.editTextField.isHidden = true
        editVC.segmentedControl.isHidden = false
        self.present(editVC, animated: true, completion: nil)
    }
    
    func calculateAge(from date: Date) -> Int {
        let calendar = Calendar.current
        let now = Date()
        let age = calendar.dateComponents([.year], from: date, to: now)
        return age.year ?? 0
    }
    
    func makeMainStackView() {
        view.addSubview(vStackView)
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            vStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            vStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    func createHStackView(elements: UIView...) -> UIStackView {
        let stackViews = UIStackView(arrangedSubviews: elements)
        stackViews.axis = .horizontal
        stackViews.spacing = 8
        stackViews.distribution = .equalCentering
        stackViews.translatesAutoresizingMaskIntoConstraints = false
        return stackViews
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeMainStackView()
        view.addSubview(interesesCollectionView)
        
        let firstNameStack = createHStackView(elements: firstName, editFirstName)
        vStackView.addArrangedSubview(firstNameStack)
        
        let lastNameStack = createHStackView(elements: lastName, editLastName)
        vStackView.addArrangedSubview(lastNameStack)
        
        let ageStack = createHStackView(elements: ageLabel, editAge)
        vStackView.addArrangedSubview(ageStack)
        
        let genderStack = createHStackView(elements: gender, editGender)
        vStackView.addArrangedSubview(genderStack)
        
        let dayStack = createHStackView(elements: birthayDay, editBirthDayButton)
        vStackView.addArrangedSubview(dayStack)
        
        let interesesFirst = createHStackView(elements: intereses, editIntereses)
        vStackView.addArrangedSubview(interesesFirst)
        let intereses = createHStackView(elements: interesesCollectionView)
        vStackView.addArrangedSubview(intereses)
        NSLayoutConstraint.activate([
                interesesCollectionView.heightAnchor.constraint(equalToConstant: 100)
            ])
        
    }
}

extension ProfileViewController: EditDelegate {
    func didSelectDate(date: Date) {
        let age = calculateAge(from: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let dateString = dateFormatter.string(from: date)
        birthayDay.text = "День рождения \(dateString)"
        ageLabel.text = "Возраст: \(age)"
    }
    
    func didSelectGender(gender: String) {
        self.gender.text = gender
    }
}




