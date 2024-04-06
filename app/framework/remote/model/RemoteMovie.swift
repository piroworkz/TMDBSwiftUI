//
//  RemoteMovie.swift
//  The Movie Database
//
//  Created by David Luna on 31/03/24.
//

import Foundation

struct RemoteMovie: Codable {
    let id: Int
    let poster_path: String?
    let title: String?
}
