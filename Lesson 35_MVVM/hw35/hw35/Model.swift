//
//  Model.swift
//  hw35
//
//  Created by Алексей on 19.10.24.
//

import Foundation

class CounterModel {
    
    var counter: Int = 0
    let minValue: Int = 0
    let maxValue = 50
    
    func plus() {
        if counter < maxValue {
            counter += 1
        }
    }
    
    func minus() {
        if counter > minValue {
            counter -= 1
        }
    }
}
