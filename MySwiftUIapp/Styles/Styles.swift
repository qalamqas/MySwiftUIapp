//
//  Styles.swift
//  MySwiftUIapp
//
//  Created by Ярослав on 14.10.2023.
//

import SwiftUI

struct ColorButtonStyle: ButtonStyle {
    var background: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 60, height: 60)
            .background(background)
            .cornerRadius(12)
            .scaleEffect(configuration.isPressed ? 0.5 : 1)
            
    }
}
