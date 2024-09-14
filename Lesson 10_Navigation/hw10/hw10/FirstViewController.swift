//
//  FirstViewController.swift
//  hw10
//
//  Created by Алексей on 3.07.24.
//

import UIKit

class FirstViewController: UIViewController {
    
    let customTitle: String = "Передача строки"
    var btnConfig: UIButton = {
        let btn = UIButton()
        btn.setTitle("Передать данные", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(pushConfig), for: .touchUpInside)
        return btn
    }()
    
    @objc func pushConfig() {
        let configVC = CustomButtonViewController(config: .init(title: "Test", textColor: .white, backGroundColor: .systemBlue, width: 50, height: 50))
        navigationController?.pushViewController(configVC, animated: true)
    }
    
    @objc func push() {
        let nextVC = SecondViewController(customTitle: customTitle)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(btnConfig)
        btnConfig.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnConfig.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        btnConfig.heightAnchor.constraint(equalToConstant: 60).isActive = true
        btnConfig.widthAnchor.constraint(equalToConstant: 150).isActive = true
        view.backgroundColor = .white
        title = customTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(push))
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
