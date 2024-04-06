//
//  StringExtensions.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

import Foundation

extension String? {
    func buildThumbPath() -> String {
        guard let path = self else { return "" }
       return "https://image.tmdb.org/t/p/w185\(path)"
    }
    
    func orEmpty() -> String {
        guard let value = self else { return "" }
        return value
    }
}


extension String {
    
    func buildThumbPath() -> String {
       return "https://image.tmdb.org/t/p/w185\(self)"
    }
    
    func buildPosterPath() -> String {
       return "https://image.tmdb.org/t/p/w500\(self)"
    }
    
    
}
