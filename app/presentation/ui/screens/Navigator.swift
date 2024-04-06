//
//  ContentView.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 01/04/24.
//

import SwiftUI

struct Navigator: View {
    
    @StateObject
    var navController: NavController = NavController.shared
    
    var body: some View {
        AppScaffold{
            navController.show(destination: .mainScreen){ _ in
                ViewModelModule.inject.moviesMainViewModel
            }
            .navigationDestination(for: Destination.self) { destination in
                navController.show(destination: destination){args in
                    ViewModelModule.inject.movieDetailViewModel(args as! Int)
                }.navigationBarHidden(true)
            }
        }
        .environmentObject(navController)
    }
    
}

#Preview {
    Navigator()
}
