//
//  MovieDetailView.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    @StateObject
    var viewModel: MovieDetailViewModel
    
    @EnvironmentObject
    var navController: NavController
    
    var body: some View {
        ZStack{
            ScrollView(.vertical) {
                PosterCarrouselView(images: viewModel.state.posters)
                
                if let movie = viewModel.state.movie {
                    MovieInfoView(movie: movie)
                        .padding(8)
                }
                
                if !viewModel.state.recommendations.isEmpty {
                    if let movieTitle = viewModel.state.movie?.title {
                        HeaderView("Recomendations based in \(movieTitle)")
                            .padding(EdgeInsets(top: 32, leading: 0, bottom: 0, trailing: 0))
                        MovieRailView(viewModel.state.recommendations, navController: navController)
                    }
                }
            }
            .scrollIndicators(.never)
            
            if viewModel.state.loading {
                LoadingIndicator()
            }
            
        }
        .onAppear{
            setAppBarTitle()
        }
        .onReceive(viewModel.objectWillChange) { _ in
            setAppBarTitle()
        }
        
    }
    
    fileprivate func setAppBarTitle(){
        if let movie = viewModel.state.movie {
            navController.update(toolbarState: navController.toolbarState.copy(title: movie.title))
        }
    }
    
    
    fileprivate func PosterCarrouselView(images: [Poster]) -> some View {
        let bounds: CGRect = UIScreen.main.bounds
        
        return ScrollView(.horizontal) {
            LazyHStack(spacing: .zero){
                ForEach(images.indices, id: \.self) { index in
                    AsyncImage(url: URL(string: images[index].path)) {phase in
                        switch phase {
                        case .empty:
                            ImagePlaceholder()
                        case .success(let image):
                            image.resizable()
                                .aspectRatio( contentMode: .fit)
                        case .failure(_):
                            ImagePlaceholder()
                        @unknown default:
                            ImagePlaceholder()
                        }
                    }.frame(
                        minWidth: bounds.width,
                        maxWidth: bounds.width,
                        minHeight: bounds.height * 0.8,
                        maxHeight: bounds.height * 0.8
                    )
                }
            }.background(.black)
        }
        .scrollIndicators(.never)
    }
    
    
    fileprivate func MovieInfoView(movie: MovieDetail) -> some View {
        return VStack(alignment: .leading){
            
            Text(movie.overview)
                .font(.system(size: 14))
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
            
            LabeledContent("Release Date: "){
                Text(movie.releaseDate)
                    .font(.system(size: 14))
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
            }
            
            LabeledContent("Status: "){
                Text(movie.status)
                    .font(.system(size: 14))
            }
            
            LabeledContent("Original Language: "){
                Text(movie.originalLanguage.uppercased())
                    .font(.system(size: 14))
            }
            
            LabeledContent("Original Title: "){
                Text(movie.originalTitle)
                    .font(.system(size: 14))
            }
            
            HStack(alignment: .center, content: {
                Text("Vote Average: ")
                    .font(.title3)
                    .bold()
                StillCircularProgressIndicator(
                    progress: movie.voteAverage,
                    size: 40
                )
            })
            .frame(maxWidth: .infinity)
        }
    }
}
