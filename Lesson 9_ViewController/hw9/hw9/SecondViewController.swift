//
//  SecondViewController.swift
//  hw9
//
//  Created by Алексей on 2.07.24.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    let firstVC = FirstViewController()
    
    var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Любой UILabel"
        title.textColor = .gray
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second View Controller"
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
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
