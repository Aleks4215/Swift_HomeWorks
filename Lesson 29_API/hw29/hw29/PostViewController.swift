//
//  PostViewController.swift
//  hw29
//
//  Created by Алексей on 21.09.24.
//

import UIKit

class PostViewController: UIViewController {
    
    let postId: Int
    let userId: Int
    
    var post: Post? {
        didSet {
            DispatchQueue.main.async {
                self.titleFieldValueLabel.text = self.post?.title
                self.textValueLabel.text = self.post?.body
            }
        }
    }
    
    var user: User? {
        didSet {
            authorValueLabel.text = user?.name
        }
    }
    
    lazy var titleFieldTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.text = "Title"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var titleFieldValueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.text = "Text"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textValueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var authorTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.text = "Author"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var authorValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(postId: Int, userId: Int) {
        self.postId = postId
        self.userId = userId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let wrapper = UIStackView(arrangedSubviews: [
            titleFieldTitleLabel,
            titleFieldValueLabel,
            textTitleLabel,
            textValueLabel,
            authorTitleLabel,
            authorValueLabel
        ])
        view.addSubview(wrapper)
        wrapper.axis = .vertical
        wrapper.spacing = 10
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            wrapper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wrapper.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            wrapper.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        APIHelper.shared.getPost(id: postId) { [weak self] post in
            guard let self = self else { return }
            self.post = post
            self.view.layoutIfNeeded()
            print(post)
        }
        APIHelper.shared.getUser(id: userId, completion: { [weak self] user in
            guard let self = self else { return }
            self.user = user
        })
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
}

#Preview {
    PostViewController(postId: 1, userId: 1)
}
