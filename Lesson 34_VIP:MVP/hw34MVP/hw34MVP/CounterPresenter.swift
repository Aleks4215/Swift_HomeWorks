//
//  CounterPresenter.swift
//  hw34MVP
//
//  Created by Алексей on 13.10.24.
//

import Foundation

protocol CounterViewProtocol: AnyObject {
    func updateCounterLabel(with value: String)
    func setPlusButtonEnabled(_ enabled: Bool)
    func setMinusButtonEnabled(_ enabled: Bool)
}

class CounterPresenter {
    
    private let model: CounterModel
    weak private var view: CounterViewProtocol?
    
    init(model: CounterModel) {
        self.model = model
    }
    
    func attachView(_ view: CounterViewProtocol) {
        self.view = view
        updateView()
    }
    
    func plusCounter() {
        model.plus()
        updateView()
    }
    
    func minusCounter() {
        model.minus()
        updateView()
    }
    
    private func updateView() {
        let counterValue = model.getCounterValue()
        view?.updateCounterLabel(with: "\(counterValue)")
        
        let isPlusButtonEnabled = model.canPlus()
        let isMinusButtonEnabled = model.canMinus()
                
        view?.setPlusButtonEnabled(isPlusButtonEnabled)
        view?.setMinusButtonEnabled(isMinusButtonEnabled)
    }
}
