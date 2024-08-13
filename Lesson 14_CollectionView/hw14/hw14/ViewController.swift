//
//  ViewController.swift
//  hw14
//
//  Created by Алексей on 26.07.24.
//

import UIKit

class ViewController: UIViewController {
    
    let devices = [
        "iphone", "ipad", "laptopcomputer", "desktopcomputer", "applewatch",
        "airpods", "airpodspro", "airpodsmax", "homepod", "applelogo", "exclamationmark.octagon", "app.badge.fill", "waveform.path.badge.plus", "gift", "burst", "smiley.fill", "tram.fill"
    ]
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DeviceCollectionViewCell.self, forCellWithReuseIdentifier: "deviceCell")
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        devices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "deviceCell", for: indexPath) as? DeviceCollectionViewCell else { return UICollectionViewCell() }
        cell.deviceImage.image = UIImage(systemName: devices[indexPath.item])
        cell.titleImage.text = devices[indexPath.item]
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let padding: CGFloat = 20
          let collectionViewSize = collectionView.frame.size.width - padding
          return CGSize(width: collectionViewSize/3, height: collectionViewSize/3)
      }
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return 10
      }
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return 10
      }
    
}
