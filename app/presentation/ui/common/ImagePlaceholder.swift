//
//  ImagePlaceholder.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 05/04/24.
//

import SwiftUI

struct ImagePlaceholder: View {
    var body: some View {
        Image("poster")
            .resizable()
    }
}

#Preview {
    ImagePlaceholder()
}
