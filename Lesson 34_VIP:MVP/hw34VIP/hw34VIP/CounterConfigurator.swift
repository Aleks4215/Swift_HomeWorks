//
//  CounterConfigurator.swift
//  hw34VIP
//
//  Created by Алексей on 13.10.24.
//

import Foundation

class CounterConfigurator {
    static func configure(viewController: CounterViewController) {
        let interactor = CounterInteractor()
        let presenter = CounterPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        
        presenter.viewController = viewController
    }
}
