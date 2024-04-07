//
//  AppError.swift
//  The Movie Database
//
//  Created by David Luna on 31/03/24.
//

import Foundation


enum AppError: Error {
    case networkError(message: String = AppError.COM_MESSAGE)
    case unknownError(message: String = AppError.COM_MESSAGE)
    case notAvailable(message: String = AppError.NOT_AVAILABLE)
    
    static let COM_MESSAGE = "There was a communication error, please try again later."
    static let NOT_AVAILABLE = "NO MOVIES AVAILABLE"
}


extension Error {
    
    func toAppError() -> AppError {
        switch self {
        default:
                .networkError(message: self.localizedDescription)
        }
    }
}
