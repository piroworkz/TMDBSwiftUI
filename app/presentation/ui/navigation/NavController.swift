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
    var path = NavigationPath()
    
    @Published
    var toolbarState: ToolbarState
    
    private init() {
        self.toolbarState = ToolbarState(title: "TMDB APP")
    }
    
    func navigateTo(destination: Destination) {
        path.append(destination)
    }
    
    func popBackStack() {
        path.removeLast()
        if path.isEmpty {
            update(toolbarState: ToolbarState(title: "TMDB APP"))
        }
    }
    
    func update(toolbarState: ToolbarState) {
        self.toolbarState.update { _ in toolbarState }
    }
    
    @ViewBuilder
    func show<T: ViewModel>(destination: Destination, inject: @escaping (_ args: Any?) -> T) -> some View {
        switch destination {
        case .mainScreen:
            MoviesMainScreen(viewModel: inject(nil) as! MoviesMainViewModel)
        case .detailScreen(let movieId):
            MovieDetailScreen(viewModel: inject(movieId) as! MovieDetailViewModel)
        }
    }
    
}
