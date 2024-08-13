//
//  ViewController.swift
//  hw17
//
//  Created by Алексей on 11.08.24.
//

import UIKit

class ViewController: UIViewController {
    
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
            let menuVC = MenuViewController(
                upButtonAction: { [weak self] in self?.moveCircle(direction: .up) },
                downButtonAction: { [weak self] in self?.moveCircle(direction: .down) },
                leftButtonAction: { [weak self] in self?.moveCircle(direction: .left) },
                rightButtonAction: { [weak self] in self?.moveCircle(direction: .right) }
            )
            
//            menuVC.modalPresentationStyle = .popover
//            menuVC.popoverPresentationController?.sourceView = circleView
            
//            let menuWidth: CGFloat = 120
//            let menuHeight: CGFloat = 150
//            
//            menuVC.popoverPresentationController?.sourceRect = CGRect(
//                x: circleCenter.x - menuWidth / 2,
//                y: circleCenter.y - menuHeight / 2,
//                width: menuWidth,
//                height: menuHeight
//            )
//            
//            menuVC.preferredContentSize = CGSize(width: menuWidth, height: menuHeight)
            
            //present(menuVC, animated: true)
            UIView.animate(withDuration: 0.3) { [weak self] in
                menuVC.view.center = self!.circleView.center
                menuVC.view.alpha = 1
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
                self.circleView.center = newCenter
                menuVC.view.alpha = 0
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(circleView)
        let menuVC = MenuViewController(
            upButtonAction: { [weak self] in self?.moveCircle(direction: .up) },
            downButtonAction: { [weak self] in self?.moveCircle(direction: .down) },
            leftButtonAction: { [weak self] in self?.moveCircle(direction: .left) },
            rightButtonAction: { [weak self] in self?.moveCircle(direction: .right) }
        )
        self.view.addSubview(menuVC.view)
        self.addChild(menuVC)
        menuVC.didMove(toParent: self)
        menuVC.view.alpha = 0
        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            circleView.widthAnchor.constraint(equalToConstant: 150),
            circleView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
    }


}

