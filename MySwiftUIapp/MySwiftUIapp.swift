//
//  MySwiftUIappApp.swift
//  MySwiftUIapp
//
//  Created by Каламкас on 04.10.2023.
//

import SwiftUI

@main
struct MySwiftUIappApp: App {
    var body: some Scene {
        WindowGroup {
            GameView()
                .preferredColorScheme(.light)
        }
    }
}
