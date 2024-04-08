//
//  AppError.swift
//  The Movie Database
//
//  Created by David Luna on 31/03/24.
//

public enum AppError: Error {
    case networkError(message: String = AppError.COM_MESSAGE)
    case unknownError(message: String = AppError.COM_MESSAGE)
    case notAvailable(message: String = AppError.NOT_AVAILABLE)
    
    public static let COM_MESSAGE = "There was a communication error, please try again later."
    public static let NOT_AVAILABLE = "NO MOVIES AVAILABLE"
}


public extension Error {
    
    func toAppError() -> AppError {
        switch self {
        default:
                .networkError()
        }
    }
}
