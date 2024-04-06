//
//  LoadingIndicator.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 05/04/24.
//

import SwiftUI

struct LoadingIndicator: View {
    
    var size: CGFloat
    
    @State
    var isOn = false
    @State
    var trimStart: CGFloat = 0.2
    @State
    var trimEnd: CGFloat = 0.3
    @State
    var rotationDegrees: Angle = .degrees(0)
    
    init(size: CGFloat = 150) {
        self.size = size
    }
    
    let duration: Double = 0.75
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.accentColor.opacity(0.2), lineWidth: min((size / 10), 20))
            
            Circle()
                .trim(from: trimStart, to: trimEnd)
                .stroke(
                    Color.accentColor,
                    style: StrokeStyle(lineWidth: min(size / 10, 20), lineCap: .round))
                .rotationEffect(rotationDegrees)
        }
        .frame(width: size, height: size)
        .onAppear{
            animate()
        }
    }
    
    func animate() {
        Timer.scheduledTimer(withTimeInterval: 0.002, repeats: true) { timer in
            withAnimation(.easeInOut(duration: (rotationDegrees.degrees * duration))) {
                self.rotationDegrees += .degrees(-1)

                if self.isOn {
                    self.trimEnd += 0.001
                    if self.trimEnd >= 1 {
                        self.isOn = false
                    }
                } else {
                    self.trimEnd -= 0.001
                    if self.trimEnd <= 0.3 {
                        self.isOn = true
                    }
                }
               
            }
        }
    }
}

#Preview {
    LoadingIndicator()
}
