//
//  MoviesService.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

import Foundation
import domain
import data


class RemoteMoviesDataSource: MoviesRemoteDataSource {
    
    private let client: HttpClient
    
    init() {
        self.client = HttpClient.shared
    }
    
    func fectchMovies(endpoint: String, completionHandler: @escaping(_ result: Result<[Movie], AppError>) -> Void) {
        client.get(NetworkResponse.self, endpoint: endpoint) { result in
            result.fold { networkResponse in
                guard let movies = networkResponse?.results.map({ movie in movie.toDomain(sortAs: endpoint)})
                else { completionHandler(.failure(AppError.notAvailable())); return }
                completionHandler(.success(movies))
            } onFailure: { appError in
                completionHandler(.failure(appError))
            }
        }
    }
    
    func getMovieDetails(by id: Int, completionHandler: @escaping (Result<MovieDetail, AppError>) -> Void) {
        client.get(RemoteMovieDetail.self, endpoint: String(id)){ result in
            result.fold { networkResponse in
                guard let detail = networkResponse?.toDomain()
                else { completionHandler(.failure(AppError.notAvailable())); return }
                completionHandler(.success(detail))
            } onFailure: { appError in
                completionHandler(.failure(appError))
            }
            
        }
    }
    
    func getMovieImages(by id: Int, completionHandler: @escaping (Result<[Poster], AppError>) -> Void) {
        client.get(RemoteImages.self, endpoint: "\(id)/images") { result in
            result.fold { remoteImages in
                guard let posters = remoteImages?.posters.map({ image in  image.toDomain() })
                else { completionHandler(.failure(AppError.notAvailable())); return }
                completionHandler(.success(posters))
            } onFailure: { appError in
                completionHandler(.failure(appError))
            }
            
        }
    }
    
    func getMovieRecommendations(by id: Int, completionHandler: @escaping(_ result: Result<[Movie], AppError>) -> Void) {
        client.get(NetworkResponse.self, endpoint: "\(id)/recommendations") { result in
            result.fold { networkResponse in
                guard let movies = networkResponse?.results.map({ movie in movie.toDomain(sortAs: "")})
                else { completionHandler(.failure(AppError.notAvailable())); return }
                completionHandler(.success(movies))
            } onFailure: { appError in
                completionHandler(.failure(appError))
            }
        }
    }
    
}
