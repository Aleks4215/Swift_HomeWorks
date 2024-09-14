//
//  FirstViewController.swift
//  hw9
//
//  Created by Алексей on 2.07.24.
//

import UIKit

class FirstViewController: UIViewController {
    
    var pushButton: UIButton = {
       let button = UIButton()
        button.setTitle("Push", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.widthAnchor.constraint(equalToConstant: 60).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pushAction), for: .touchUpInside)
        return button
    }()
    
    @objc func pushAction(sender: UIButton!) {
        let nextVC = FirstViewController()
        let secondVC = SecondViewController()
        navigationController?.pushViewController(nextVC, animated: true)
        navigationController?.pushViewController(secondVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "First View Controller"
        view.addSubview(pushButton)
        pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
