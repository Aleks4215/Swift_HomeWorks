//
//  ViewController.swift
//  hw13
//
//  Created by Алексей on 26.07.24.
//

import UIKit

class ViewController: UIViewController {
    
    let firstTaskButton: UIButton = {
       let button = UIButton()
        button.setTitle("Первое задание", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .lightGray
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        button.addTarget(self, action: #selector(firstButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    let secondTaskButton: UIButton = {
       let button = UIButton()
        button.setTitle("Второе задание", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .lightGray
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        button.addTarget(self, action: #selector(secondButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    let thirdTaskButton: UIButton = {
       let button = UIButton()
        button.setTitle("Третье задание", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .lightGray
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        button.addTarget(self, action: #selector(thirdButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    @objc func firstButtonDidTap() {
        let firstTableView = FirstTableViewController()
        navigationController?.pushViewController(firstTableView, animated: true)
    }
    
    @objc func secondButtonDidTap() {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc func thirdButtonDidTap() {
        let thirdVC = ThirdTableViewController()
        navigationController?.pushViewController(thirdVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(firstTaskButton)
        view.addSubview(secondTaskButton)
        view.addSubview(thirdTaskButton)
        
        NSLayoutConstraint.activate([
            firstTaskButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            firstTaskButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            firstTaskButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            secondTaskButton.topAnchor.constraint(equalTo: firstTaskButton.bottomAnchor, constant: 10),
            secondTaskButton.leadingAnchor.constraint(equalTo: firstTaskButton.leadingAnchor),
            secondTaskButton.trailingAnchor.constraint(equalTo: firstTaskButton.trailingAnchor),
            thirdTaskButton.topAnchor.constraint(equalTo: secondTaskButton.bottomAnchor, constant: 10),
            thirdTaskButton.leadingAnchor.constraint(equalTo: secondTaskButton.leadingAnchor),
            thirdTaskButton.trailingAnchor.constraint(equalTo: secondTaskButton.trailingAnchor)
        ])
    }


}

