//
//  ColorsSet.swift
//  MySwiftUIapp
//
//  Created by Каламкас on 04.10.2023.
//

import Foundation

extension Array where Element: Equatable {
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }
}
