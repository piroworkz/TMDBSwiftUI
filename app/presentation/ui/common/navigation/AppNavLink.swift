//
//  AppNavLink.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 04/04/24.
//

import SwiftUI

struct AppNavLink<L: View> : View {
    
    let label: L
    let value: Destination
    
    init( value: Destination, @ViewBuilder label: () -> L) {
        self.label = label()
        self.value = value
    }
    
    
    var body: some View {
        NavigationLink(value: value) {
            label
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
}
