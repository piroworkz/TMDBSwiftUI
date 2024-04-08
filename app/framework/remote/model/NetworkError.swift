//
//  NetworkError.swift
//  The Movie Database
//
//  Created by David Luna on 31/03/24.
//

import Foundation
import domain

struct NetworkError: Codable {
    let statusCode: Int
    let statusMessage: String
    let success: Bool
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success
    }
}

extension NetworkError{
    func toAppError() -> AppError {
        AppError.networkError(message: self.statusMessage)
    }
}
