//
//  SongsListView.swift
//  SwiftUiMusic
//
//  Created by Antonio Carabantes Millán on 25/2/22.
//

import SwiftUI

struct SongsListView: View {
    
    @StateObject var viewModel = SongsListViewModel(songsDataSurce: SongsRepository())
    
    
    var body: some View {
        
        NavigationView {
            List(viewModel.songs) { song in
                
                NavigationLink {
                    PlayerView(song: song)
                } label: {
                    ItemSongList(song: song)
                }
                
            }
            .onAppear(perform: {
                viewModel.getSongs()
            })
            .navigationTitle("Songs List")
        }.accentColor(.white)
    }
    
}




struct SongsListView_Previews: PreviewProvider {
    
    
    
    static let viewModel = SongsListViewModel(songsDataSurce: SongsRepository())
    
    static var previews: some View {
        SongsListView(viewModel: viewModel)
    }
}
