//
//  ViewController.swift
//  hw34MVP
//
//  Created by Алексей on 13.10.24.
//

import UIKit

class ViewController: UIViewController, CounterViewProtocol {
    
    private var presenter: CounterPresenter? = {
       let model = CounterModel()
       let presenter = CounterPresenter(model: model)
        return presenter
    }()
    
    
    lazy var counterLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var plusButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(plusButtonDidTap), for: .touchUpInside)
        button.setTitle("+", for: .normal)
        return button
    }()
    
    lazy var minusButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("-", for: .normal)
        button.addTarget(self, action: #selector(minusButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            plusButton,
            minusButton
        ])
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    @objc func plusButtonDidTap() {
        presenter?.plusCounter()
    }
    
    @objc func minusButtonDidTap() {
        presenter?.minusCounter()
    }
    
    func updateCounterLabel(with value: String) {
        counterLabel.text = value
    }
    
    func setPlusButtonEnabled(_ enabled: Bool) {
        plusButton.isEnabled = enabled
        plusButton.alpha = enabled ? 1.0 : 0.5
    }
    
    func setMinusButtonEnabled(_ enabled: Bool) {
        minusButton.isEnabled = enabled
        minusButton.alpha = enabled ? 1.0 : 0.5
    }
    
    private func setupUI() {
        view.addSubview(stackView)
        view.addSubview(counterLabel)
        
        NSLayoutConstraint.activate([
            counterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            counterLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: counterLabel.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
        presenter?.attachView(self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


}
