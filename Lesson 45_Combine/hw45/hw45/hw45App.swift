//
//  hw45App.swift
//  hw45
//
//  Created by Алексей on 21.11.24.
//

import SwiftUI

@main
struct hw45App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: CounterViewModel(model: CounterModel()))
        }
    }
}
