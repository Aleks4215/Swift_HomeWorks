//
//  CounterViewController.swift
//  hw34VIP
//
//  Created by Алексей on 13.10.24.
//

import UIKit

protocol CounterDisplayLogic: AnyObject {
    func displayCounter(viewModel: Counter.ViewModel)
}

class CounterViewController: UIViewController, CounterDisplayLogic {
    
    var interactor: CounterBisinessLogic?
    let initialValue = 0
    
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
        let request = Counter.Request(action: .plus)
        interactor?.changeCounter(request: request)
    }
    
    @objc func minusButtonDidTap() {
        let request = Counter.Request(action: .minus)
        interactor?.changeCounter(request: request)
    }
    
    func displayCounter(viewModel: Counter.ViewModel) {
        counterLabel.text = viewModel.counterText
        plusButton.isEnabled = viewModel.isPlusEnabled
        minusButton.isEnabled = viewModel.isMinusEnabled
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        view.addSubview(counterLabel)
        
        NSLayoutConstraint.activate([
            counterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            counterLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: counterLabel.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        let request = Counter.Response(value: initialValue)
    }
}
