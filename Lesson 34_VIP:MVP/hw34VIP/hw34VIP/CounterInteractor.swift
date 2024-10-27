//
//  CounterInteractor.swift
//  hw34VIP
//
//  Created by Алексей on 13.10.24.
//

import Foundation

protocol CounterBisinessLogic {
    func changeCounter(request: Counter.Request)
}

class CounterInteractor: CounterBisinessLogic {
    
    var presenter: CounterPresentationLogic?
    var counterValue: Int = 0
    
    
    func changeCounter(request: Counter.Request) {
        switch request.action {
            case .plus:
                if counterValue < 50 {
                    counterValue += 1
                }
            case .minus:
                if counterValue > 0 {
                    counterValue -= 1
                }
        }
        
        let response = Counter.Response(value: counterValue)
        presenter?.presentCounter(response: response)
    }
}
