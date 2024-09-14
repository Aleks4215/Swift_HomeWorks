//
//  ViewController.swift
//  hw16
//
//  Created by Алексей on 3.08.24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.random
        view.frame.size = CGSize(width: 150, height: 150)
        view.layer.cornerRadius = view.frame.width / 2
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(gesture)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupGesture()
    }
    
    private func setupGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        if circleView.superview == nil || gesture.view == circleView {
            let location = generateRandomCoordinates()
            createCircle(at: location)
        }
    }
    
    private func createCircle(at point: CGPoint) {
        circleView.removeFromSuperview()
        circleView.center = point
        circleView.backgroundColor = UIColor.random
        view.addSubview(circleView)
    }
    
    
    private func generateRandomCoordinates() -> CGPoint {
        let safeArea = view.safeAreaLayoutGuide.layoutFrame
        let radius = circleView.frame.size.width / 2
        let x = CGFloat.random(in: safeArea.minX + radius...safeArea.maxX - radius)
        let y = CGFloat.random(in: safeArea.minY + radius...safeArea.maxY - radius)
        return CGPoint(x: x, y: y)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}


