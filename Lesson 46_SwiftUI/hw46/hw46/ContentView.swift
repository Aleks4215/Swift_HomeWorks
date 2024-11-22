//
//  ContentView.swift
//  hw46
//
//  Created by Алексей on 21.11.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: FirstView()) {
                    Text("Первое задание")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                NavigationLink(destination: SecondView()) {
                    Text("Второе задание")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                }

                NavigationLink(destination: ThirdView()) {
                    Text("Третье задание")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Задания")
        }
    }
}

#Preview {
    ContentView()
}

