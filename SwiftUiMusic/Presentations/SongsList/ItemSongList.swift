//
//  ItemSongList.swift
//  SwiftUiMusic
//
//  Created by Antonio Carabantes Millán on 25/2/22.
//

import SwiftUI

struct ItemSongList: View {
    
    var song: Song
    
    
    var body: some View {
        HStack {
            AsyncImageCover(imagePath: song.coverAlbum).frame(width: 90, height: 90)
            VStack(alignment: .leading){
                Text(song.title).font(.title2)
                Spacer().frame(height: 5)
                Text(song.artistName)
                    .font(.body)
                    .foregroundColor(Color.gray)
            }
            Spacer()
        }.padding(12)
    }
}

struct ItemSongList_Previews: PreviewProvider {
    static var previews: some View {
        ItemSongList(song: SongsRepository.previewView())
    }
}
