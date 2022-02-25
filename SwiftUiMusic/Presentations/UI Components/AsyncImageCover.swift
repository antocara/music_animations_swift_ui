//
//  AsyncImageCover.swift
//  SwiftUiMusic
//
//  Created by Antonio Carabantes Millán on 25/2/22.
//

import SwiftUI

struct AsyncImageCover: View {
    
    let imagePath: String
    
    
    var body: some View {
        AsyncImage(url: URL(string: imagePath)
                   ,transaction: Transaction(animation: .spring(response: 1, dampingFraction: 0.9, blendDuration: 0.25))
        ) { phase in
            switch phase {
            case .success(let image):
                image.resizable()
            case .failure(_):
                Image(systemName: "photo.on.rectangle.angled")
                    .iconModifier()
            case .empty:
                Image(systemName: "")
                    .iconModifier()
            @unknown default:
                ProgressView()
            }
        }
    }
}

struct AsyncImageCover_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageCover(imagePath: "")
    }
}
