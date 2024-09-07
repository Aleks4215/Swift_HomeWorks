//
//  ViewController.swift
//  hw15
//
//  Created by Алексей on 30.07.24.
//

import UIKit

class ViewController: UIViewController {
    
    
    let showAllertButton: UIButton = {
       let button = UIButton()
        button.setTitle("Show Alert", for: .normal)
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func showAlert() {
        let alert = CustomAlertViewViewController(
            titleText: "Offer",
            descriptionText: "A set of 130 elements, perfectly fitting each other. Click, drag, resize, adapt, combine. A set of 130 elements, perfectly fitting each other",
            firstButtonTitle: "IGNORE",
            secondButtonTitle: "GOT IT",
            firstAction: { print("First action") },
            secondAction: { print("Second Action") }
        )
        alert.modalPresentationStyle = .overFullScreen
        alert.modalTransitionStyle = .crossDissolve
        present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(showAllertButton)
        showAllertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showAllertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}

