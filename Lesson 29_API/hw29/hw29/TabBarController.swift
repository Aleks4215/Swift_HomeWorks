//
//  TabBarController.swift
//  hw29
//
//  Created by Алексей on 20.09.24.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let photosVC = PhotosViewController()
        let postsVC = ViewController()
        let usersVC = UsersViewController()
        
        let postsNavigationController = UINavigationController(rootViewController: postsVC)
        let usersNavigationController = UINavigationController(rootViewController: usersVC)
        
        postsNavigationController.tabBarItem = UITabBarItem(
            title: "Posts",
            image: UIImage(systemName: "doc.text.fill"), 
            tag: 1
        )
        
        photosVC.tabBarItem = UITabBarItem(
                   title: "Photos",
                   image: UIImage(systemName: "photo"),
                   tag: 2
               )
        usersVC.tabBarItem = UITabBarItem(
                   title: "Users",
                   image: UIImage(systemName: "person.2"),
                   tag: 3
               )
        
        viewControllers = [postsNavigationController, photosVC, usersNavigationController]

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
        tabBar.backgroundColor = .white
    }
}
