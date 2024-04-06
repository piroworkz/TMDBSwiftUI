//
//  HeaderView.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 03/04/24.
//

import SwiftUI

func HeaderView(_ title: String) -> some View {
    return ZStack {
        Text(title)
            .scaledToFill()
            .foregroundColor(Color.white)
            .bold()
            .padding(4)
    }
    .frame(
        minWidth: 0,
        maxWidth: .infinity,
        minHeight: 0,
        maxHeight: .infinity,
        alignment: .center
    )
    .background(Color.gray)
}

#Preview {
    HeaderView("Title")
}
