//
//  CounterViewModel.swift
//  hw45
//
//  Created by Алексей on 21.11.24.
//

import Foundation
import Combine

class CounterViewModel: ObservableObject {
    
    @Published var counter: Int = 0
    
    private var model: CounterModel
    private var cancellables: Set<AnyCancellable> = []
    
    init(model: CounterModel) {
        self.model = model
        model.counterPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newValue in
                self?.counter = newValue
            }
            .store(in: &cancellables)
    }
    
    func plus() {
        model.plus()
    }
    
    func minus() {
        model.minus()
    }
}
