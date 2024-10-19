//
//  ViewModel.swift
//  hw35
//
//  Created by Алексей on 19.10.24.
//

import Foundation

class CounterViewModel {
    
    private let model = CounterModel()
    var displayValue: Bindable<String> = Bindable()
    
    init() {
        updateDisplay()
    }
    
    func plusCounter() {
        model.plus()
        updateDisplay()
    }
    
    func minusCounter() {
        model.minus()
        updateDisplay()
    }
    
    func updateDisplay() {
        displayValue.value = "\(model.counter)"
    }
}
