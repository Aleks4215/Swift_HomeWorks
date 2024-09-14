//
//  NavigationController.swift
//  hw10
//
//  Created by Алексей on 3.07.24.
//

import UIKit

class NavigationController: UINavigationController {

    let firstVC = FirstViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [firstVC]
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
