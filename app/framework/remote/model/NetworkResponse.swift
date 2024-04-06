//
//  NetworkResponse.swift
//  The Movie Database
//
//  Created by David Luna on 31/03/24.
//

import Foundation


struct NetworkResponse :Codable {
    let page: Int
    let results: [RemoteMovie]
    let total_pages: Int
    let total_results: Int
}
