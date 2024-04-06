//
//  Updatable.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

import Foundation

protocol Updatable {
    mutating func update(current: (Self) -> Self)
}

extension Updatable {
    mutating func update(current: (Self) -> Self) {
        self = current(self)
    }
}
