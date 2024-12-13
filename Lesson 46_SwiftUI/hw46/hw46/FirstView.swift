//
//  FirstView.swift
//  hw46
//
//  Created by Алексей on 22.11.24.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        VStack {
            Image("London")
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay(
                    ZStack {
                        Text("Business")
                            .foregroundColor(.white)
                            .font(.headline)
                    }.padding(),
                    alignment: .bottomTrailing
                    
                )
                .shadow(radius: 5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    FirstView()
}

