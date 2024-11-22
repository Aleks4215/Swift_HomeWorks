//
//  SecondView.swift
//  hw46
//
//  Created by Алексей on 22.11.24.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            VStack {
                VStack(spacing: 4) {
                    Text("Soba Noodles")
                        .font(.title)
                        .bold()
                    Text("Chinese")
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                }
                .padding(.top, 20)
                
                Image("Soba-Noodles-016")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 300, minHeight: 250, maxHeight: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding([.horizontal, .vertical], 20)
                
                Text("$25")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 20)
                
                Button("Buy") {
                    
                }
                .bold()
                .frame(maxWidth: 85, maxHeight: 35)
                .background(Color.yellow)
                .foregroundStyle(.black)
                .cornerRadius(55)
                .padding(.horizontal, 100)
                
                Spacer()
            }
            .frame(minWidth: 350, maxHeight: 550)
            .background(Color.white)
            .cornerRadius(20)
            .padding([.vertical, .horizontal], 20)
        }
    }
    
}

#Preview {
    SecondView()
}
