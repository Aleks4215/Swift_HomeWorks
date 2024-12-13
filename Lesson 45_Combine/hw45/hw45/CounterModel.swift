//
//  CounterModel.swift
//  hw45
//
//  Created by Алексей on 21.11.24.
//

import Foundation
import Combine

class CounterModel {
    private var counter: Int = 0
    let counterPublisher = PassthroughSubject<Int, Never>()
    
    func plus() {
        counter += 1
        counterPublisher.send(counter)
    }
    
    func minus() {
        counter -= 1
        counterPublisher.send(counter)
    }
}
