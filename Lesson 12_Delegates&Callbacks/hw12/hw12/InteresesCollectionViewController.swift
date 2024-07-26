//
//  InteresesCollectionViewController.swift
//  hw12
//
//  Created by Алексей on 25.07.24.
//

import UIKit

class InteresesCollectionViewController: UICollectionView {
    
    private let interesesLayout = UICollectionViewFlowLayout()
    
    var interesName: ((String) -> Void)?
    
    var intereses: [String] = ["Гулять", "Пить Пиво", "В свободное время пишу на JS"]
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: interesesLayout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    private func configure() {
        backgroundColor = .systemBlue
        translatesAutoresizingMaskIntoConstraints = false
        
        delegate = self
        dataSource = self
        
        register(InteresesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        bounces = false
        showsHorizontalScrollIndicator = false
    }
    
}

extension InteresesCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return intereses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? InteresesCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.interesLabel.text = intereses[indexPath.item]
        return cell
        }

    }

extension InteresesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let font = UIFont(name: "Arial-BoldMT", size: 18)
        let attributes = [NSAttributedString.Key.font: font as Any]
        let text = intereses[indexPath.item]
        let textSize = (text as NSString).size(withAttributes: attributes)
        let padding: CGFloat = 16.0
        let cellWidth = textSize.width + padding
        return CGSize(width: cellWidth, height: collectionView.frame.height / 2)
    }
}


