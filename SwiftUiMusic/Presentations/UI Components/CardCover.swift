//
//  CardCover.swift
//  SwiftUiMusic
//
//  Created by Antonio Carabantes Millán on 25/2/22.
//

import SwiftUI

struct CardCover: View {
    
    let coverImage: String
    
    private let coverSize = UIScreen.main.bounds.width - 120

    
    var body: some View {
        
        AsyncImageCover(imagePath: coverImage)
            .transition(.slide)
            .frame(width: coverSize, height: coverSize)
            .clipShape(Rectangle())
            .cornerRadius(8)
            .shadow(color: Color.black, radius: 4, x: 3, y: 2)
    }
}

struct CardCover_Previews: PreviewProvider {
    static var previews: some View {
        CardCover(coverImage: "u2_cover")
    }
}
