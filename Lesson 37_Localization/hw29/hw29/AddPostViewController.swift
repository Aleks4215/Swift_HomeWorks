//
//  AddPostViewController.swift
//  hw29
//
//  Created by Алексей on 21.09.24.
//

import UIKit

class AddPostViewController: UIViewController {
    
    var onSave: (() -> Void)?
    var onCreate: (() -> Void)?
    let id: Int?
    
    init(id: Int?) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var post: Post? {
        didSet {
            titleTexField.text = post?.title
            textTextField.text = post?.body
        }
    }
    
    lazy var titleTexField: UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.tintColor = .systemBlue
        textField.placeholder = NSLocalizedString("post.title", comment: "")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var textTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.tintColor = .systemBlue
        textField.placeholder = NSLocalizedString("post.text", comment: "")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var createButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("\(NSLocalizedString("post.addPost", comment: ""))", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(createButtonDidTapped), for: .touchUpInside)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("\(NSLocalizedString("post.save", comment: ""))", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(saveButtonDidTapped), for: .touchUpInside)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func createButtonDidTapped() {
        guard let title = titleTexField.text, !title.isEmpty,
              let body = textTextField.text, !body.isEmpty else {
            return
        }
        let userId = 1

        APIHelper.shared.createPost(userId: userId, title: title, body: body) { [weak self] in
            DispatchQueue.main.async {
                self?.onCreate?()
                self?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func saveButtonDidTapped() {
        guard let id = id, let title = titleTexField.text, let body = textTextField.text else { return }
        
        APIHelper.shared.updatePost(id: id, title: title, body: body) { [weak self] in
            DispatchQueue.main.async {
                self?.onSave?()
                self?.dismiss(animated: true, completion: nil)
            }
        }
    }

    
    private func setupUI() {
        let wrapper = UIStackView(arrangedSubviews: [
            titleTexField,
            textTextField,
            createButton,
            saveButton
        ])
        wrapper.axis = .vertical
        wrapper.distribution = .equalSpacing
        wrapper.spacing = 15
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(wrapper)
        
        NSLayoutConstraint.activate([
            wrapper.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            wrapper.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            wrapper.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        if let id = id {
            APIHelper.shared.getPost(id: id) { [weak self] post in
                self?.post = post
            }
        }
    }
}
