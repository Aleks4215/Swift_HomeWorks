//
//  AddBookmarkViewController.swift
//  hw23
//
//  Created by Алексей on 1.09.24.
//


import UIKit

class AddBookmarkViewController: UIViewController {
    
    var bookmarkTitle: String?
    var bookmarkURL: String?
    var onAddBookmark: ((String, String) -> Void)?
    
    private lazy var wrapper: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.setCustomSpacing(50, after: urlTextfield)
        stackView.distribution = .fillProportionally
        stackView.isUserInteractionEnabled = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleTextfield: UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.tintColor = .systemBlue
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var urlTextfield: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.tintColor = .systemBlue
        textField.translatesAutoresizingMaskIntoConstraints = false
         return textField
    }()
    
    private let addButton: UIButton = {
       let button = UIButton()
        button.setTitle("Добавить в закладки", for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(addBookmark), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        updateAddButtonState()
    }
    
    init(title: String?, url: String?) {
        self.bookmarkTitle = title
        self.bookmarkURL = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupGesture()
        self.view.backgroundColor = .white
        view.addSubview(wrapper)
        wrapper.addArrangedSubview(titleTextfield)
        wrapper.addArrangedSubview(urlTextfield)
        wrapper.addArrangedSubview(addButton)
    
        
        titleTextfield.text = bookmarkTitle
        urlTextfield.text = bookmarkURL
            
            NSLayoutConstraint.activate([
                wrapper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                wrapper.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                wrapper.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
              
            ])
    
    }
    
    @objc private func addBookmark() {
        if let title = titleTextfield.text, let url = urlTextfield.text {
            onAddBookmark?(title, url)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    private func updateAddButtonState() {
        addButton.isEnabled = !(bookmarkTitle?.isEmpty ?? true) && !(bookmarkURL?.isEmpty ?? true)
    }
    
    func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        titleTextfield.resignFirstResponder()
        urlTextfield.resignFirstResponder()
    }
}

#Preview {
    AddBookmarkViewController(title: "123", url: "3213")
}
