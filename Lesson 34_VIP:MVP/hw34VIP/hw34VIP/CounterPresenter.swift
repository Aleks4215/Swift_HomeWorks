//
//  CounterPresenter.swift
//  hw34VIP
//
//  Created by Алексей on 13.10.24.
//

import Foundation

protocol CounterPresentationLogic {
    func presentCounter(response: Counter.Response)
}

class CounterPresenter: CounterPresentationLogic {
    
    weak var viewController: CounterDisplayLogic?
    
    func presentCounter(response: Counter.Response) {
        let isPlusEnabled = response.value < 50
        let isMinusEnabled = response.value > 0
        
        let viewModel = Counter.ViewModel(
            counterText: "\(response.value)",
            isPlusEnabled: isPlusEnabled,
            isMinusEnabled: isMinusEnabled
        )
        
        viewController?.displayCounter(viewModel: viewModel)
    }
}
