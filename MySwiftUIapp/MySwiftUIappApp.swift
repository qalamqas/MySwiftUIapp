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
            ContentView(colors: generate(level: 1))
        }
    }
}


let minColorValue = 0.156862745
let maxColorValue = 0.941176471
var roundColors: [Color] = []
var randomColors: [Double] = []
var step: Double = 0.0

var level = 1


extension MySwiftUIappApp {
    func generate(level: Int) -> [Color] {
        switch level {
        case 1: step = 0.05
        case 2: step = 0.15
        case 3: step = 0.25
        default: step = 0.3
        }
        
        for i in 40...200 {
            randomColors.append(1/230*Double(i))
        }
        
        var R0 = pickRandomColor(randomColors)
        randomColors.remove(object: R0)
        var G0 = pickRandomColor(randomColors)
        randomColors.remove(object: G0)
        var B0 = pickRandomColor(randomColors)
        randomColors.remove(object: B0)
        
        roundColors.append(Color(red: R0, green: G0, blue: B0, opacity: 1))
        roundColors.append(Color(red: R0, green: G0, blue: B0, opacity: 1))
        
        for var color in 2...15 {
            if R0 != maxColorValue {R0 = R0 + step}
            if G0 != maxColorValue {G0 = G0 + step}
            if B0 != maxColorValue {B0 = B0 + step}
            roundColors.append(Color(red: R0, green: G0, blue: B0, opacity: 1))
            color = color + 1
        }
        
        return roundColors.shuffled()
    }
    
    func pickRandomColor(_: [Double]) -> Double {
        let randomColor = randomColors.randomElement()
        return randomColor!
    }
}
