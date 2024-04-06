//
//  MoviesMainScreen.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 01/04/24.
//

import SwiftUI

struct MoviesMainScreen: View {
    
    @StateObject
    var viewModel: MoviesMainViewModel
    
    @EnvironmentObject
    var navController: NavController
    
    var body: some View {
        ZStack {
            ScrollView(.vertical){
                ForEach(viewModel.state.sectionTitles.indices, id: \.self){index in
                    let currentList = getCurrentSectionItems(index)
                    if !currentList.isEmpty {
                        HeaderView(viewModel.state.sectionTitles[index])
                        MovieRailView(currentList, navController: navController)
                            .scrollIndicators(.never)
                    }
                }
            }
            if viewModel.state.loading {
                LoadingIndicator()
            }
        }
    }
    
    fileprivate func getCurrentSectionItems(_ index: Int) -> Array<Movie> {
        switch index {
        case 0:
            viewModel.state.popularMovies
        case 1:
            viewModel.state.nowPlayingMovies
        case 2:
            viewModel.state.topRatedMovies
        default:
            viewModel.state.upcomingMovies
        }
    }
    
}
