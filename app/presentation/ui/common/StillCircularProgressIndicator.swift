//
//  CircularProgressIndicator.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 03/04/24.
//

import SwiftUI

struct StillCircularProgressIndicator: View {
    
    private var progress: CGFloat = 0
    private var colorFor: (background: Color, foreground: Color)
    private var size: CGFloat
    
    init(
        colorFor: (background: Color, foreground: Color) = (background: Color.accentColor, foreground: .accentColor),
        progress: CGFloat,
        size: CGFloat
    ) {
        self.progress = progress
        self.colorFor = colorFor
        self.size = max(size, 40)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(colorFor.background.opacity(0.2), lineWidth: min((size / 10), 20))
            
            Circle()
                .trim(from: 0, to: progress / 100 * 10)
                .stroke(
                    colorFor.foreground,
                    style: StrokeStyle(lineWidth: min((size / 10), 20), lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            Text(String(format: "%.1f", progress))
                .fontWeight(.bold)
                .font(.system(size: size / 3.5))
            
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    StillCircularProgressIndicator(
        progress: 7.2,
        size: 50
    )
}
