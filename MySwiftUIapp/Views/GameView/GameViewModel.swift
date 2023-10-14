//
//  GameViewModel.swift
//  MySwiftUIapp
//
//  Created by Ярослав on 14.10.2023.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var colors: [Color] = []
    @Published var level: Int = 1
    
    private let maxColorValue = 0.99
    private var randomColors: [Color] = []
    private var roundColors: [Color] = []
    private var roundColorsSet: Set<Color> = []
    private var step: Double = 0.0
    private var R0 = 0.0, G0 = 0.0, B0 = 0.0
    private var randomBase = 0
    private var R01 = 0.0, G01 = 0.0, B01 = 0.0
    private var R02 = 0.0, G02 = 0.0, B02 = 0.0
    
    init() {
        colors = generateRandom(level: level)
    }
    
    private func isCorrect(_ index: Int) -> Bool {
        colors.filter { $0 == colors[index] }.count > 1
    }
    
    func proceedUserInput(_ index: Int) {
        if isCorrect(index) {
            level += 1
            withAnimation(.bouncy(duration: 0.2, extraBounce: 0.2)) {
                colors = generateRandom(level: level)
            }
        } else {
            // Делаем что-то если юзеер ошибся
        }
    }
    
    func generateRandom(level: Int) -> [Color] {
        var temp: [Color] = []
        for _ in 0...15 {
            temp.append(Color(red: .random(in: 0.1...0.9),
                              green: .random(in: 0.1...0.9),
                              blue: .random(in: 0.1...0.9)))
        }

        temp[14] = temp[15]
        return temp
    }
    
    func generate(level: Int) -> [Color] {
        // по уровню сложности определяю диапазон базовых цветов и шаг преобразования цвета
        switch level {
        case 1: randomBase = 0
        case 2: randomBase = 0
        case 3: randomBase = 0
        case 4: step = 0.05; randomBase = 1
        case 5: step = 0.043; randomBase = 1
        case 6: step = 0.04; randomBase = 2
        case 7: step = 0.033; randomBase = 2
        case 8: step = 0.03; randomBase = 2
        case 9: step = 0.023; randomBase = 3
        case 10: step = 0.02; randomBase = 3
        case 11: step = 0.03; randomBase = 13
        case 12: step = 0.03; randomBase = 14
        default: step = 0.0; randomBase = 0
        }
        
        // диапазон базовых цветов
        switch randomBase {
        case 0:
            while roundColorsSet.count < 16 {roundColorsSet.insert(Color.random())};
            let repeatingColor = roundColorsSet.randomElement()!
            print(repeatingColor)
            print(roundColorsSet)
            for h in 0...14 {
                randomColors.append(Array(roundColorsSet)[h]) }
            randomColors.append(repeatingColor)
            print(repeatingColor)
            return randomColors
            
        case 1: R0 = Double.random(in: 0.0...0.5); G0 = Double.random(in: 0.0...0.5); B0 = Double.random(in: 0.0...0.5)
        case 2: R0 = Double.random(in: 0.3...0.5); G0 = Double.random(in: 0.3...0.5); B0 = Double.random(in: 0.3...0.5)
        case 3: R0 = Double.random(in: 0.4...0.7); G0 = Double.random(in: 0.4...0.7); B0 = Double.random(in: 0.4...0.7)
            // определение диапазона цветов для сине-желтых дальтоников
        case 13:
            print("Colorblind test Yellow-Blue")
            R01 = Double.random(in: 0.0...0.4); G01 = Double.random(in: 0.0...0.4); B01 = Double.random(in: 0.7...1)
            R02 = Double.random(in: 0.6...1); G02 = Double.random(in: 0.5...1); B02 = Double.random(in: 0.0...0.2)
            
            // определение диапазона цветов для красно-зеленых дальтоников
        case 14:
            print("Colorblind test Red-Green")
            R01 = Double.random(in: 0.7...0.9); G01 = Double.random(in: 0.0...0.3); B01 = Double.random(in: 0.0...0.3)
            R02 = Double.random(in: 0.1...0.2); G02 = Double.random(in: 0.7...0.9); B02 = Double.random(in: 0.0...0.2)
        default: R0 = 0; G0 = 0; B0 = 0
        }
        
        // записываю в массив 30 цветов меняя базовые цвета
        if randomBase < 13 {
            for _ in 0...7 {
                if (R0 + step) <= maxColorValue {R0 = R0 + step}
                randomColors.append(Color(red: R0, green: G0, blue: B0, opacity: 1.0))
            }
            
            for _ in 8...15 {
                if (G0 + step) <= maxColorValue {G0 = G0 + step}
                randomColors.append(Color(red: R0, green: G0, blue: B0, opacity: 1.0))
            }
            
            for _ in 16...23 {
                if (B0 + step) <= maxColorValue {B0 = B0 + step}
                randomColors.append(Color(red: R0, green: G0, blue: B0, opacity: 1.0))
            }
            
            for _ in 24...29 {
                if (R0 + step) <= maxColorValue {R0 = R0 + step/2}
                if (G0 + step) <= maxColorValue {G0 = G0 + step/2}
                if (B0 + step) <= maxColorValue {B0 = B0 + step/2}
                randomColors.append(Color(red: R0, green: G0, blue: B0, opacity: 1.0))
            }
            
            randomColors.shuffle()
            
            // формирую палитру уникальных цветов для вывода на экран
            for i in 0...29 {
                roundColorsSet.insert(randomColors[i])
            }
            
            print(roundColorsSet.count)
            
            for i in 0...14 {
                roundColors.append(Array(roundColorsSet)[i])
            }
            
            let repeatingColor = roundColors.randomElement()!
            print(roundColors)
            print(repeatingColor)
            roundColors.append(repeatingColor)
            return roundColors
        }
        else { print("Colorblind test")
            for _ in 0...14 {
                if (R01 + step) <= maxColorValue {R01 = R01 + step}
                if (G01 + step) <= maxColorValue {G01 = G01 + step}
                if (B01 + step) <= maxColorValue {B01 = B01 + step}
                randomColors.append(Color(red: R01, green: G01, blue: B01, opacity: 1.0))
            }
            
            let repeatingColorB = randomColors[0...14].randomElement()!
            randomColors.insert(repeatingColorB, at: 0)
            
            for _ in 15...29 {
                if (R02 + step) <= maxColorValue {R02 = R02 + step}
                if (G02 + step) <= maxColorValue {G02 = G02 + step}
                if (B02 + step) <= maxColorValue {B02 = B02 + step};
                randomColors.append(Color(red: R02, green: G02, blue: B02, opacity: 1.0))
            }
            let repeatingColorC = randomColors[15...29].randomElement()!
            randomColors.insert(repeatingColorC, at: 1)
            
            // формирую палитру уникальных цветов для вывода на экран
            for i in 0...29 {
                roundColorsSet.insert(randomColors[i])
            }
            
            print(roundColorsSet.count)
            
            for i in 0...14 {
                roundColors.append(Array(roundColorsSet)[i])
            }
            
            roundColors.append(repeatingColorB)
            roundColors.append(repeatingColorC)
            
            print(roundColors)
            print(repeatingColorC)
            print(repeatingColorB)
            return roundColors
        }
    }
}
