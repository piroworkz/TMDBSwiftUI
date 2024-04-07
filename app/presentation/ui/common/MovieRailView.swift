//
//  MovieRailView.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 03/04/24.
//

import SwiftUI

func MovieRailView(_ movies: [Movie], navController: NavController) -> some View {
    return ScrollView(.horizontal){
        LazyHGrid(
            rows: [GridItem()],
            alignment: .top,
            spacing: .zero
        ){
            ForEach(movies) { movie in
                MovieGridItem(movie, navController: navController)
            }
        }
    }.scrollIndicators(.never)
}


func MovieGridItem(_ movie: Movie, navController: NavController) -> some View {
    let placeholder = ImagePlaceholder()
        .aspectRatio(contentMode: .fit)
    
    return VStack(alignment: .center){
        ZStack(alignment: .center) {
            AsyncImage(url: URL(string: movie.posterPath)){ phase in
                switch phase {
                case .empty:
                    placeholder
                case .success(let image):
                    image
                        .resizable()
                        .position(CGPoint(x: 80, y: 190))
                        .aspectRatio(contentMode: .fill)
                case .failure(_):
                    placeholder
                @unknown default:
                    placeholder
                }
            }
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
            
            Image("film_mask")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
        }
        .frame(width: 160, height: 140)
        .clipped()
        .onTapGesture {
            navController.navigateTo(destination: .DetailScreen(id: movie.id))
        }
        Text(movie.title )
            .lineLimit(1)
            .font(.caption)
            .padding(EdgeInsets(top: 0, leading: 4, bottom: 16, trailing: 4))
        
    } .frame(width: 160)
}

