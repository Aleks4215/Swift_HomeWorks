//
//  SecondScreen.swift
//  hw47
//
//  Created by Алексей on 29.11.24.
//

import SwiftUI

struct SecondScreen: View {
    
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            Button("Первый экран") {
                isPresented.toggle()
            }
        }
        .sheet(isPresented: $isPresented) {
            FirstScreen()
        }
        .font(.largeTitle)
    }
}

#Preview {
    SecondScreen()
}
