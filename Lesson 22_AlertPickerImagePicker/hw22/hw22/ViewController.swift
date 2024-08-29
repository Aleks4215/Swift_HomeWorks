//
//  ViewController.swift
//  hw22
//
//  Created by Алексей on 29.08.24.
//

import UIKit

class ViewController: UIViewController {
    
    private let cities: [String] = ["Москва", "Лондон", "Париж", "Нью-Йорк"]
    
    private var isPickerVisible = false
    private var selectedCity: String?
    
    lazy var showAlertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Показать сообщение", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return button
    }()
    
    lazy var selectedCityLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите город"
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var showPickerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выбрать город", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(togglePickerVisibility), for: .touchUpInside)
        return button
    }()
    
    lazy var citiesPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.dataSource = self
        picker.isHidden = true
        return picker
    }()
    
    lazy var pickerToolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.backgroundColor = .white
        toolbar.sizeToFit()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        
        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveCitySelection))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([flexibleSpace, saveButton], animated: false)
        toolbar.isHidden = true
        
        return toolbar
    }()
    
    lazy var uploadPhotoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Загрузить изображение", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(uploadPhotoButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var selectedImageImageView: UIImageView = {
       let imageVIew = UIImageView()
        imageVIew.isHidden = true
        imageVIew.contentMode = .scaleAspectFit
        imageVIew.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageVIew.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageVIew.translatesAutoresizingMaskIntoConstraints = false
        return imageVIew
    }()
    
    @objc private func showAlert() {
        let alert = UIAlertController(title: "Важное сообщение", message: "Спасибо, что выбрали наше приложение!", preferredStyle: .alert)
        self.present(alert, animated: true)
        let okMessage = UIAlertController(title: "Спасибо", message: nil, preferredStyle: .alert)
        okMessage.addAction(UIAlertAction(title: "Ок", style: .default, handler: { _ in
            self.dismiss(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: {
            _ in
            self.present(okMessage, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .destructive, handler: {
            _ in
            self.dismiss(animated: true)
        }))
    }
    
    @objc private func togglePickerVisibility() {
        isPickerVisible.toggle()
        citiesPickerView.isHidden = !isPickerVisible
        pickerToolbar.isHidden = !isPickerVisible
    }
    
    @objc private func saveCitySelection() {
        if let city = selectedCity {
            selectedCityLabel.text = "Выбранный город: \(city)"
            selectedCityLabel.textColor = .black
        }
        togglePickerVisibility()
    }
    
    @objc private func uploadPhotoButtonTapped() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func addSubviews(views: [UIView]) {
        views.forEach { element in
            view.addSubview(element)
        }
    }
    
    func setupUI() {
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            showAlertButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            showAlertButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            showAlertButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            selectedCityLabel.topAnchor.constraint(equalTo: showAlertButton.bottomAnchor, constant: 20),
            selectedCityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            showPickerButton.topAnchor.constraint(equalTo: selectedCityLabel.bottomAnchor, constant: 20),
            showPickerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            citiesPickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            citiesPickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            citiesPickerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            pickerToolbar.bottomAnchor.constraint(equalTo: citiesPickerView.topAnchor),
            pickerToolbar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pickerToolbar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            selectedImageImageView.topAnchor.constraint(equalTo: showPickerButton.bottomAnchor, constant: 15),
            selectedImageImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            uploadPhotoButton.topAnchor.constraint(equalTo: selectedImageImageView.bottomAnchor, constant: 20),
            uploadPhotoButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            uploadPhotoButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            uploadPhotoButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews(views: [showAlertButton, selectedCityLabel, showPickerButton, pickerToolbar, citiesPickerView, selectedImageImageView, uploadPhotoButton])
        setupUI()
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = cities[row]
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            selectedImageImageView.image = image
            selectedImageImageView.isHidden = false
        }
        picker.dismiss(animated: true)
    }
}


