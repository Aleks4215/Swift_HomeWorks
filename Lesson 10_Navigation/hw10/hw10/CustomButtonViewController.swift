//
//  CustomButtonViewController.swift
//  hw10
//
//  Created by Алексей on 3.07.24.
//

import UIKit

class CustomButtonViewController: UIViewController {
    
    var button = UIButton()
    
    struct Config {
        var title: String
        var textColor: UIColor
        var backGroundColor: UIColor
        var width: CGFloat
        var height: CGFloat
    }
    
    let config: Config
    
    init(config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(config.title, for: .normal)
        button.setTitleColor(config.textColor, for: .normal)
        button.backgroundColor = config.backGroundColor
        button.widthAnchor.constraint(equalToConstant: config.width).isActive = true
        button.heightAnchor.constraint(equalToConstant: config.height).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
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
