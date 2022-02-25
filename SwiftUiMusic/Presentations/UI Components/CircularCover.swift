//
//  Cover.swift
//  SwiftUiMusic
//
//  Created by Antonio Carabantes Millán on 25/2/22.
//

import SwiftUI

struct CircularCover: View {
    
    let imagePath: String
    var isAnimating: Bool
    var isPlaying: Bool
    
    
    var body: some View {
        
        ZStack{

            AsyncImageCover(imagePath: imagePath)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .shadow(color: Color.black, radius: 4, x: 3, y: 2)
            
            Circle()
                .foregroundColor(Color.white)
                .frame(width: 20, height: 20)
                .overlay(Circle().stroke(Color.gray, lineWidth: 1).opacity(0.5))
        }
        .scaleEffect(isPlaying ? 1.15 : 1)
        .animation(.easeIn(duration: 1), value: isPlaying)
        .rotationEffect( .degrees( isAnimating ? 360 : 0))
        .animation(
            isAnimating ? .linear(duration: 7).repeatForever(autoreverses: false) : .easeOut(duration: 7)
            ,value: isAnimating
        )
        
    }
}

struct Cover_Previews: PreviewProvider {
    
    
    static var previews: some View {
        CircularCover(imagePath: "u2_cover", isAnimating: false, isPlaying: true)
    }
}
