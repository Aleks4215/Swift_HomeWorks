//
//  DetailsNoteViewController.swift
//  hw31
//
//  Created by Алексей on 6.10.24.
//

import UIKit

class DetailsNoteViewController: UIViewController {
    
     var note: Note?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var detailsTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 16)
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        displayNote()
    }
    
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(detailsTextView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            detailsTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            detailsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            detailsTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func displayNote() {
        titleLabel.text = note?.title
        detailsTextView.text = note?.details
    }
}

