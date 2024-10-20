//
//  Model.swift
//  hw34VIP
//
//  Created by Алексей on 13.10.24.
//

import Foundation

enum Counter {
    
    struct Request {
        let action: CounterAction
    }
    
    struct Response {
        let value: Int
    }
    
    struct ViewModel {
        let counterText: String
        let isPlusEnabled: Bool
        let isMinusEnabled: Bool
    }
    
    enum CounterAction {
        case plus
        case minus
    }
}
