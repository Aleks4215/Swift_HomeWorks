//
//  ViewController.swift
//  hw17
//
//  Created by Алексей on 11.08.24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var menuVC = MenuViewController(
        upButtonAction: { [weak self] in 
            self?.moveCircle(direction: .up) },
        downButtonAction: {[weak self] in
            self?.moveCircle(direction: .down) },
        leftButtonAction: {[weak self] in
            self?.moveCircle(direction: .left) },
        rightButtonAction: {[weak self] in
            self?.moveCircle(direction: .right) }
    )
    
    lazy var circleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 75
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showMovementMenu(_:)))
        view.addGestureRecognizer(gestureRecognizer)

        return view
    }()
    
    
    @objc private func showMovementMenu(_ recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == .began {
            let menuSize: CGFloat = 100
            menuVC.preferredContentSize = CGSize(width: menuSize, height: menuSize)
            let circleBounds = circleView.bounds
            menuVC.view.frame = CGRect(
                x: (circleBounds.width - menuSize) / 2,
                y: (circleBounds.height - menuSize) / 2,
                width: menuSize,
                height: menuSize
            )
            circleView.addSubview(menuVC.view)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.menuVC.view.alpha = 1
            }
        }
    }


    
    enum Direction {
          case up, down, left, right
      }
    
    func moveCircle(direction: Direction) {
        let distance: CGFloat = 70
        var newCenter = circleView.center
        
        switch direction {
        case .up:
            newCenter.y -= distance
        case .down:
            newCenter.y += distance
        case .left:
            newCenter.x -= distance
        case .right:
            newCenter.x += distance
        }
        
        let halfWidth = circleView.bounds.width / 2
        let halfHeight = circleView.bounds.height / 2
        
        let safeArea = view.safeAreaLayoutGuide
        
        let minX = safeArea.layoutFrame.minX + halfWidth
        let maxX = safeArea.layoutFrame.maxX - halfWidth
        let minY = safeArea.layoutFrame.minY + halfHeight
        let maxY = safeArea.layoutFrame.maxY - halfHeight
        
        newCenter.x = max(minX, min(newCenter.x, maxX))
        newCenter.y = max(minY, min(newCenter.y, maxY))
        
        UIView.animate(withDuration: 0.3) {
            if let menuVC = self.children.first(where: {$0 is MenuViewController} ) {
                menuVC.view.alpha = 0
            }
            self.circleView.center = newCenter
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(circleView)
        self.addChild(menuVC)
        self.view.addSubview(menuVC.view)
        menuVC.view.alpha = 0
        menuVC.didMove(toParent: self)
        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            circleView.widthAnchor.constraint(equalToConstant: 150),
            circleView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
    }


}

