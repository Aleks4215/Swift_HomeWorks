//
//  CounterConfigurator.swift
//  hw34VIP
//
//  Created by Алексей on 13.10.24.
//

import UIKit

class CounterConfigurator {
    static func build(viewController: CounterViewController) -> UIViewController {
        let interactor = CounterInteractor()
        let presenter = CounterPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        return viewController
    }
}
