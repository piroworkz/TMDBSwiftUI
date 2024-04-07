//
//  NavigationController.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 05/04/24.
//

import SwiftUI

class NavController: ObservableObject {
    
    static let shared: NavController = NavController()
    
    @Published
    var destinations = [Destination]()
    
    @Published
    var toolbarState: ToolbarState  = ToolbarState(title: "TMDB APP")
    
    private init() {
    }
    
    func navigateTo(destination: Destination) {
        destinations.append(destination)
        print("After append: \(destinations)")
    }
    
    func popBackStack() {
        destinations.removeLast()
        if destinations.isEmpty {
            update(toolbarState: ToolbarState(title: "TMDB APP"))
        }
    }
    
    func update(toolbarState: ToolbarState) {
        self.toolbarState.update { _ in toolbarState }
    }
    
    @ViewBuilder
    func show<T: ViewModel>(destination: Destination, inject: @escaping (_ args: Any?) -> T) -> some View {
        switch destination {
        case .MainScreen :
            MoviesMainScreen(viewModel: inject(nil) as! MoviesMainViewModel)
        case .DetailScreen(let movieId):
            MovieDetailScreen(viewModel: inject(movieId) as! MovieDetailViewModel)
        }
    }
    
}
