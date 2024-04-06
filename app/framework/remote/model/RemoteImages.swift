//
//  RemoteImages.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 03/04/24.
//

import Foundation


struct RemoteImages: Codable {
    let posters: [RemotePoster]
}

struct RemotePoster: Codable {
    let file_path: String
}
