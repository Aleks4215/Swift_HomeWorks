//
//  Tabbar.swift
//  hw47
//
//  Created by Алексей on 29.11.24.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
        TabView {
            Tab("Первый экран", systemImage: "1.circle") {
                FirstScreen()
            }
            Tab("Второй экран", systemImage: "2.circle") {
                SecondScreen()
            }
        }
    }
}

#Preview {
    Tabbar()
}
