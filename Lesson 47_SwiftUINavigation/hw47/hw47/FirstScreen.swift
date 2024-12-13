//
//  FirstScreen.swift
//  hw47
//
//  Created by Алексей on 29.11.24.
//

import SwiftUI

struct FirstScreen: View {
    var body: some View {
        NavigationView {
            NavigationLink("Второй экран", destination: SecondScreen())
                .font(.largeTitle)
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    FirstScreen()
}
