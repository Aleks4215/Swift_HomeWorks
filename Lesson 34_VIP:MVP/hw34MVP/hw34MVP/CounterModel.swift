//
//  CounterModel.swift
//  hw34MVP
//
//  Created by Алексей on 13.10.24.
//

import Foundation

class CounterModel {
    private var counter: Int = 0
    private var minLimit: Int = 0
    private var maxLimit: Int = 50
    
    func plus() {
        if counter < maxLimit {
            counter += 1
        }
    }
    
    func minus() {
        if counter > minLimit {
            counter -= 1
        }
    }
    
    func getCounterValue() -> Int {
        return counter
    }
    
    func canPlus() -> Bool {
        return counter < maxLimit
    }
    
    func canMinus() -> Bool {
        return counter > minLimit
    }
}
