//
//  RequestBuilder.swift
//  The Movie Database
//
//  Created by David Luna on 31/03/24.
//

import Foundation


class RequestBuilder{
    
    static let shared : RequestBuilder = RequestBuilder()
    
    private static let ACCEPT = "Accept"
    private static let APIKEY = "api_key"
    
    private init() {
        
    }
    
    func build(for endpoint: String) -> URLRequest? {
        guard let finalUrl = configBaseUrl(endpoint: endpoint) else {return nil }
        var request = URLRequest(url: finalUrl)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: RequestBuilder.ACCEPT)
        return request
    }
    
    
    
    private func createURL() -> URL? {
        let url = URL(string: APIConstants.baseUrl)
        return url
    }
    
    private func configBaseUrl(endpoint: String) -> URL? {
        var components = URLComponents()
        components.path = endpoint
        components.queryItems = [
            URLQueryItem(name: RequestBuilder.APIKEY, value: APIConstants.token)
        ]
        let urlComponents = components
        guard let finalUrl = urlComponents.url(relativeTo: createURL()) else { return nil }
        
        return finalUrl
    }
}
