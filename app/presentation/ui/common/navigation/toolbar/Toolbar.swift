//
//  Toolbar.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 04/04/24.
//

import SwiftUI

struct Toolbar: View {
    
    @EnvironmentObject
    var navController: NavController
    
    var body: some View {
        HStack {
            Button(action: {
                if !navController.destinations.isEmpty {
                    navController.popBackStack()
                }
            }, label: {
                Image(systemName: navController.destinations.isEmpty ? "line.3.horizontal" : "chevron.left")
                    .padding(.leading)
            })
            
            Text(navController.toolbarState.title)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .padding(.leading)
            Spacer()
            if navController.toolbarState.showActions {
                Image(systemName: "ellipsis")
                    .padding(.trailing)
            }
        }
        .frame(height: 50)
        .foregroundColor(navController.toolbarState.backGroundColor != .white ? .white : .black)
        .background(navController.toolbarState.backGroundColor.ignoresSafeArea(edges: .bottom))
        .onAppear{
            print("Toolbar state: \(navController.toolbarState)")
        }
        
    }
}
