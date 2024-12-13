//
//  Avatar.swift
//  hw44
//
//  Created by Алексей on 19.11.24.
//

import SwiftUI

struct Avatar: View {
    var body: some View {
        Circle()
            .fill(Gradient(colors: [.red, .blue]))
            .frame(width: 250, height: 250)
    }
}

#Preview {
    Avatar()
}
