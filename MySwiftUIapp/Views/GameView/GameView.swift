//
//  ContentView.swift
//  MySwiftUIapp
//
//  Created by Каламкас on 04.10.2023.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()

    private let columns = Array(repeating: GridItem(.fixed(60)), count: 4)
    
    var body: some View {
        NavigationStack {
            Text("Level: \(viewModel.level)")
                .bold()
                .padding(.bottom, 25)
            
            LazyVGrid(columns: columns) {
                ForEach(0...15, id: \.self) { index in
                    Button("") {
                        viewModel.proceedUserInput(index)
                    }
                    .buttonStyle(ColorButtonStyle(background: viewModel.colors[index]))
                }
            }
            .navigationBarTitle("My SwiftUI App", displayMode: .inline)
        }
    }
}

extension Color {
    static func random() -> Color {
        Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}
