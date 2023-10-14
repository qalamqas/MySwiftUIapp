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
        Spacer()
        
        VStack {
            Button("NEXT") {
                
            }.frame(width: 60, height: 40)
                .background(.cyan)
        }
        
        Spacer()
        VStack {
            LazyVGrid(columns: [GridItem(.fixed(60)), GridItem(.fixed(60)), GridItem(.fixed(60)), GridItem(.fixed(60))]) {
                ForEach(0...15, id: \.self) { index in
                    Rectangle()
                        .frame(width: 60, height: 60)
                        .cornerRadius(12)
                        .foregroundColor(colors[index])
                }
            }.onSubmit {
                
            }
            
        }
        Spacer()
        Spacer()
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
    
