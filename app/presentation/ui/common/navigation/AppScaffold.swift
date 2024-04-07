//
//  AppScaffold.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 04/04/24.
//

import SwiftUI

struct AppScaffold<V: View>: View {
    
    @EnvironmentObject
    var navController: NavController
    
    let content: V
    
    init(@ViewBuilder content: () -> V) {
        self.content = content()
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            Toolbar()
            NavigationStack(
                path: $navController.destinations,
                root: {
                    content
                        .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            ).navigationBarHidden(true)
        }.background(.black)
    }
}
