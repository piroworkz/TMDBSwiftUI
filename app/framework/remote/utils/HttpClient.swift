//
//  HttpClient.swift
//  The Movie Database
//
//  Created by David Luna on 31/03/24.
//

import Foundation

class HttpClient {
    
    static let shared: HttpClient = HttpClient()
    
    private let session: URLSession
    private let builder: RequestBuilder
    
    private init() {
        session = URLSession.shared
        builder = RequestBuilder.shared
    }
    
    func get<T: Codable>(_ type: T.Type, endpoint: String, completionHandler: @escaping(_ result: Result<T?, AppError>) -> Void) {
        guard let request = builder.build(for: endpoint) else { return }
        session.dataTask(with: request) { data, urlResponse, error in
            self.processResult(data: data, error: error, completionHandler: completionHandler)
        }.resume()
    }
    
    fileprivate func processResult<T: Codable>(data: Data?, error: (any Error)?, completionHandler: @escaping(_ result: Result<T?, AppError>) -> Void) {
        if let error = error {
            completionHandler(.failure(error.toAppError()))
            return
        }
        if let data = data {
            if let response = try? JSONDecoder().decode(T.self, from: data) {
                completionHandler(.success(response))
            } else {
                guard let networkError = try? JSONDecoder().decode(NetworkError.self, from: data) else {
                    completionHandler(.failure(.unknownError(message: "Decoder error")))
                    return
                }
                completionHandler(.failure(networkError.toAppError()))
            }
        }
    }
    
}
