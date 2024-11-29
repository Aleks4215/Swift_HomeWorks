//
//  ThirdView.swift
//  hw46
//
//  Created by Алексей on 22.11.24.
//

import SwiftUI

struct ThirdView: View {
    var body: some View {
        ScrollView {
            VStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.pink)
                    .frame(minWidth: 340, minHeight: 370)
                    .padding([.leading, .trailing, .top], 20)
                Text("Title")
                    .font(.title)
                    .bold()
                    .padding([.top], 10)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .padding([.leading, .trailing], 15)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ThirdView()
}
