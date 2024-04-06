//
//  ResultExtensions.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

import Foundation

extension Result{
    func fold(onSuccess:(Success) -> Void, onFailure: (Failure) -> Void) {
        switch self {
        case .success(let response):
            onSuccess(response)
        case .failure(let error):
            onFailure(error)
        }
    }
    
    func foldForPublish(onSuccess: @escaping (Success) -> Void, onFailure: @escaping (Failure) -> Void) {
        DispatchQueue.main.async {
            switch self {
            case .success(let response):
                onSuccess(response)
                
            case .failure(let error):
                onFailure(error)
            }
        }
    }
}
