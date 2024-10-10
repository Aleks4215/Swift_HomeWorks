//
//  DetailFriendViewController.swift
//  hw32
//
//  Created by Алексей on 6.10.24.
//

import UIKit

class DetailFriendViewController: UIViewController {
    
    var friend: Friend
    
    init(friend: Friend) {
        self.friend = friend
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var wrapper: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            firstNameLabel,
            lastNameLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "First name: \(friend.firstName)"
        return label
    }()
    
    lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Last name: \(friend.lastName)"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(wrapper)
        
        NSLayoutConstraint.activate([
            wrapper.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wrapper.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            wrapper.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            wrapper.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}



