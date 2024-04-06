//
//  APIConstants.swift
//  The Movie Database
//
//  Created by David Luna on 31/03/24.
//

import Foundation

class APIConstants {
    
    static let shared: APIConstants = APIConstants()
    
    private init() {
        
    }
    
    public static var token: String {
        get {
            ProcessInfo.processInfo.environment["TOKEN"] ?? ""
        }
    }
    
    public static var baseUrl: String {
        get {
            ProcessInfo.processInfo.environment["BASE_URL"] ?? ""
        }
    }
}
