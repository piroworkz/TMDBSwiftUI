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
            navController.show(destination: .MainScreen){_ in
                ViewModelModule.inject.moviesMain()
            }
            .navigationDestination(for: Destination.self) { destination in
                navController.show(destination: destination){movieId in
                    ViewModelModule.inject.movieDetail(movieId: movieId as! Int)
                }.navigationBarHidden(true)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }.environmentObject(navController)
    }
}

#Preview {
    Navigator()
}
