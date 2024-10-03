//
//  ViewController.swift
//  hw30
//
//  Created by Алексей on 26.09.24.
//

import UIKit

class ViewController: UIViewController {
    
    var randomNumber = 0
    var attempts = 0
    var level = 1
    var score = 0
    
    let storage = LocalStorage()

    lazy var hintLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Угадайте число"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите число"
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var checkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Проверить", for: .normal)
        button.addTarget(self, action: #selector(checkNumber), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var levelLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Уровень: \(level)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Очки: \(score)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(hintLabel)
        view.addSubview(inputTextField)
        view.addSubview(checkButton)
        view.addSubview(resultLabel)
        view.addSubview(levelLabel)
        view.addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
            hintLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            hintLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            hintLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            
            inputTextField.topAnchor.constraint(equalTo: hintLabel.bottomAnchor, constant: 20),
            inputTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            inputTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            inputTextField.heightAnchor.constraint(equalToConstant: 40),
            
            checkButton.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 20),
            checkButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            checkButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            checkButton.heightAnchor.constraint(equalToConstant: 50),
            
            resultLabel.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 20),
            resultLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            resultLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            
            levelLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 40),
            levelLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            scoreLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 40),
            scoreLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func checkNumber() {
        guard let inputText = inputTextField.text,
              let guessedNumber = Int(inputText) else {
            resultLabel.text = "Введите корректное число"
            return
        }

        attempts += 1
        switch guessedNumber {
        case _ where guessedNumber < randomNumber:
            resultLabel.text = "Число больше"
        case _ where guessedNumber > randomNumber:
            resultLabel.text = "Число меньше"
        default:
            let pointsForLevel = 100 - attempts
            score += max(pointsForLevel, 0)
            resultLabel.text = "Вы угадали! Переход на следующий уровень!"
            level += 1
            saveGame()
            startNewLevel()
        }
    }
    
    func startNewGame() {
        if let savedGame = storage.preparedGame() {
            level = savedGame.level
            score = savedGame.score
        } else {
            level = 1
            score = 0
        }
        startNewLevel()
    }
    
    func startNewLevel() {
        let levelRange = level * 100
        randomNumber = Int.random(in: 1...levelRange)
        attempts = 0
        hintLabel.text = "Угадайте число от 1 до \(levelRange)"
        inputTextField.text = ""
        resultLabel.text = ""
        levelLabel.text = "Уровень: \(level)"
        scoreLabel.text = "Очки: \(score)"
    }
    
    func saveGame() {
        let game = Game(level: level, score: score)
        storage.save(game: game)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startNewGame()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveGame()
    }

}


