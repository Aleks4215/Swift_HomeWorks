//
//  InteresesCollectionViewCell.swift
//  hw12
//
//  Created by Алексей on 25.07.24.
//
import UIKit

class InteresesCollectionViewCell: UICollectionViewCell {
    
    var intereses = InteresesCollectionViewController().intereses
    
    let interesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .init(name: "Arial Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let editButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "highlighter"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.tintColor = .white
        button.isHidden = true
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.isHidden = true
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .black
        layer.cornerRadius = 10
        contentView.addSubview(interesLabel)
        if interesLabel.text != "Добавить интерес" {
            contentView.addSubview(editButton)
            contentView.addSubview(deleteButton)
        }
    }

    
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            interesLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            interesLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            editButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -10),
            editButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            
            deleteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10)
        ])
    }
}


