//
//  ContentView.swift
//  MySwiftUIapp
//
//  Created by Каламкас on 04.10.2023.
//

import SwiftUI

struct ContentView: View {
    var colors: [Color]
    var body: some View {
        LazyVGrid(columns: [GridItem(.fixed(50)), GridItem(.fixed(50)), GridItem(.fixed(50)), GridItem(.fixed(50))]) {
            ForEach(0...15, id: \.self) { index in
                Rectangle()
                    .frame(width: 50, height: 50)
                    .cornerRadius(12)
                    .foregroundColor(colors[index])
                    .onAppear {
                        print(colors[index])
                    }
            }
        }
    }
}

//#Preview {
//    ContentView(colors: [.red])
//}

extension Color {
    static func random() -> Color {
        Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}
