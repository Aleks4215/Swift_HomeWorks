//
//  DeviceCollectionViewCell.swift
//  hw14
//
//  Created by Алексей on 26.07.24.
//

import UIKit

class DeviceCollectionViewCell: UICollectionViewCell {
    
    let deviceImage: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleImage: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(deviceImage)
        contentView.addSubview(titleImage)
        contentView.backgroundColor = .systemFill
        contentView.layer.cornerRadius = 10
        NSLayoutConstraint.activate([
            deviceImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            deviceImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            deviceImage.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            titleImage.topAnchor.constraint(equalTo: deviceImage.bottomAnchor, constant: 10),
            titleImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            titleImage.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            titleImage.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            titleImage.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
