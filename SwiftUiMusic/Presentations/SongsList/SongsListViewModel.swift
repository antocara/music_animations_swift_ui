//
//  SongsListViewModel.swift
//  SwiftUiMusic
//
//  Created by Antonio Carabantes Millán on 25/2/22.
//

import Foundation
import Combine


class SongsListViewModel: ObservableObject{
    
    
    @Published var songs: [Song] = []

    
    private var cancellables: Set<AnyCancellable> = []
    private let songsDataSurce: SongsDataSource
    
    init(songsDataSurce: SongsDataSource){
        self.songsDataSurce = songsDataSurce
    }
    
    
    func getSongs(){
        self.songsDataSurce
            .songs()
            .receive(on: DispatchQueue.main)
            .sink { values in
                self.songs = values
            }.store(in: &cancellables)
    }
    
  
}
