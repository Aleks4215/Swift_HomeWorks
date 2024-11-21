//
//  ContentView.swift
//  hw45
//
//  Created by Алексей on 21.11.24.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State var counter: Int = 0
    @ObservedObject var viewModel: CounterViewModel
    
    var body: some View {
        VStack {
            HStack {
                Button("Minus") {
                    viewModel.minus()
                }
                Text("\(viewModel.counter)")
                Button("Plus") {
                    viewModel.plus()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView( viewModel: CounterViewModel(model: CounterModel()))
}
