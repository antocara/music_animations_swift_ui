//
//  WaveCircle.swift
//  SwiftUiMusic
//
//  Created by Antonio Carabantes Millán on 25/2/22.
//

import SwiftUI

struct WaveCircle: View {
    
     @Binding var isAnimating: Bool
     let opacity: Double
     let size: CGFloat
     let scaleEffect: CGFloat
    
    
    
    var body: some View {
        Circle().fill()
            .foregroundColor(Color.progressPlayer)
            .opacity(opacity)
            .frame(width: size, height: size)
            .scaleEffect(isAnimating ? scaleEffect : 0.5)
            .animation(
                    .easeInOut(duration: 1)
                    .repeatForever()
                , value: isAnimating
            )
            .opacity(isAnimating ? 1 : 0)
            .animation(
                    .easeOut(duration: 2)
                , value: isAnimating
            )
    }
}

struct WaveCircle_Previews: PreviewProvider {
    static var previews: some View {
        WaveCircle(isAnimating: .constant(true),
                   opacity: 0.5,
                   size: 50,
                   scaleEffect: 3)
    }
}
