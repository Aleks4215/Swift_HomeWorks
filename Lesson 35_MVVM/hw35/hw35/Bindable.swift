//
//  Bindable.swift
//  hw35
//
//  Created by Алексей on 19.10.24.
//

import Foundation


class Bindable<T> {
    
    var value: T? {
        didSet {
            handlers.forEach { handler in
                handler(value)
            }
        }
    }
    
    private var handlers = [(T?) -> Void]()
    
    func bind(_ handler: @escaping (T?) -> Void) {
        handlers.append(handler)
        handler(value)
    }
}
