//
//  ViewController.swift
//  hw9
//
//  Created by Алексей on 2.07.24.
//

import UIKit

class TabBarController: UITabBarController {
    
    let firstVC = FirstViewController()
    let secondVC = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationVC = UINavigationController(rootViewController: firstVC)
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        viewControllers = [navigationVC, secondVC]
    }


}

