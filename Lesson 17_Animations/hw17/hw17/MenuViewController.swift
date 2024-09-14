//
//  MenuViewController.swift
//  hw17
//
//  Created by Алексей on 11.08.24.
//

import UIKit

class MenuViewController: UIViewController {
    
    var upButtonAction: (() -> Void)?
    var downButtonAction: (() -> Void)?
    var leftButtonAction: (() -> Void)?
    var rightButtonAction: (() -> Void)?
    
    init(upButtonAction: @escaping () -> Void, downButtonAction: @escaping () -> Void, leftButtonAction: @escaping () -> Void, rightButtonAction: @escaping () -> Void) {
        self.upButtonAction = upButtonAction
        self.downButtonAction = downButtonAction
        self.leftButtonAction = leftButtonAction
        self.rightButtonAction = rightButtonAction
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func createButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }
    
    @objc func moveUpButtonTapped() {
        upButtonAction?()
    }
    
    @objc func moveDownButtonTapped() {
        downButtonAction?()
    }
    
    @objc func moveLeftButtonTapped() {
        leftButtonAction?()
    }
    
    @objc func moveRightButtonTapped() {
        rightButtonAction?()
    }
    
    private func setupMenu() {
        view.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        let upButton = createButton(title: "↑")
        upButton.addTarget(self, action: #selector(moveUpButtonTapped), for: .touchUpInside)
        verticalStackView.addArrangedSubview(upButton)
        
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .fill
        horizontalStackView.distribution = .fillEqually
        
        let leftButton = createButton(title: "←")
        leftButton.addTarget(self, action: #selector(moveLeftButtonTapped), for: .touchUpInside)
        horizontalStackView.addArrangedSubview(leftButton)
        
        let rightButton = createButton(title: "→")
        rightButton.addTarget(self, action: #selector(moveRightButtonTapped), for: .touchUpInside)
        horizontalStackView.addArrangedSubview(rightButton)
        
        verticalStackView.addArrangedSubview(horizontalStackView)
        
        let downButton = createButton(title: "↓")
        downButton.addTarget(self, action: #selector(moveDownButtonTapped), for: .touchUpInside)
        verticalStackView.addArrangedSubview(downButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenu()
    }
}

