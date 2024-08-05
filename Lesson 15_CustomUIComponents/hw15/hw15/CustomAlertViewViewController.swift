//
//  CustomAlertViewViewController.swift
//  hw15
//
//  Created by Алексей on 30.07.24.
//

import UIKit

class CustomAlertViewViewController: UIViewController {
    
    let titleText: String
    let descriptionText: String
    let firstButtonTitle: String
    let secondButtonTitle: String
    var firstAction: (() -> Void)?
    var secondAction: (() -> Void)?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 5
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    let firstButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let secondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 12
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init(titleText: String, descriptionText: String, firstButtonTitle: String, secondButtonTitle: String, firstAction: (() -> Void)?, secondAction: (() -> Void)?) {
        self.titleText = titleText
        self.descriptionText = descriptionText
        self.firstButtonTitle = firstButtonTitle
        self.secondButtonTitle = secondButtonTitle
        self.firstAction = firstAction
        self.secondAction = secondAction
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        //view.backgroundColor = .clear
        view.addSubview(verticalStackView)
        //MARK: - Setup Text
        titleLabel.text = titleText
        descriptionLabel.text = descriptionText
        firstButton.setTitle(firstButtonTitle, for: .normal)
        secondButton.setTitle(secondButtonTitle, for: .normal)
        //MARK: - Setup actions
        firstButton.addTarget(self, action: #selector(firstButtonTapped), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(secondButtonTapped), for: .touchUpInside)
        //MARK: - Setup Constraints
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(firstButton)
        horizontalStackView.addArrangedSubview(secondButton)
        // Дбавляем пустое вью для нижнего отступа
        let bottomSpacer = UIView()
        bottomSpacer.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.addArrangedSubview(bottomSpacer)
        
        // Установка ограничений для вертикального стэк-вью
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.widthAnchor.constraint(equalToConstant: view.bounds.width - 40),
            verticalStackView.heightAnchor.constraint(equalToConstant: 200),
            
            horizontalStackView.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 10),
            horizontalStackView.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -10),
            
            firstButton.heightAnchor.constraint(equalToConstant: 44),
            secondButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc private func firstButtonTapped() {
        firstAction?()
    }
    
    @objc private func secondButtonTapped() {
        secondAction?()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        setupUI()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
