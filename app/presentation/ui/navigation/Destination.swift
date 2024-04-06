//
//  Destination.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 05/04/24.
//

import Foundation
import SwiftUI

enum Destination: Hashable, Codable {
    case mainScreen
    case detailScreen(movieId: Int)
}
