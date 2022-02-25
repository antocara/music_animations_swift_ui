//
//  BackgroundBlur.swift
//  SwiftUiMusic
//
//  Created by Antonio Carabantes Millán on 25/2/22.
//

import SwiftUI

struct BackgroundBlur: View {
    
    let imageName: String
    
    var body: some View {
        ZStack{
        
            AsyncImageCover(imagePath: imageName)
                .transition(.slide)
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 7, opaque: true)
           
           Rectangle().opacity(0.6).edgesIgnoringSafeArea(.all)
           
       }
    }
}



struct BackgroundBlur_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundBlur(imageName: "music_background")
    }
}
