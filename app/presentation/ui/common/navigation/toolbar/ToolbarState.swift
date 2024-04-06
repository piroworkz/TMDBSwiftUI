//
//  ToolbarState.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 04/04/24.
//

import Foundation
import SwiftUI

struct ToolbarState {
    var isTopDestination: Bool
    var showActions: Bool
    var title: String
    var backGroundColor: Color
    
    init(
        isTopDestination: Bool = true,
        showActions: Bool = false,
        title: String = "",
        backGroundColor: Color =  Color.primary
    ) {
        self.isTopDestination = isTopDestination
        self.showActions = showActions
        self.title = title
        self.backGroundColor = backGroundColor
    }
}


extension ToolbarState: Updatable {
    
    func copy(
        isTopDestination: Bool? = nil,
        showActions: Bool? = nil,
        title: String? = nil,
        backGroundColor: Color? =  nil
    ) -> ToolbarState {
        ToolbarState(
            isTopDestination: isTopDestination ?? self.isTopDestination,
            showActions: showActions ?? self.showActions,
            title: title ?? self.title,
            backGroundColor: backGroundColor ?? self.backGroundColor
        )
    }
    
}
