//
//  ContentViewModel.swift
//  SwiftUiMusic
//
//  Created by Antonio Carabantes Millán on 25/2/22.
//

import Foundation
import Combine
import SwiftUI

class PlayerViewModel: ObservableObject{
    
    
    @Published var songs: [Song] = []
    @Published var firstSong: Song?
    @Published var progressSongValue: CGFloat = 0.0
    
    private var cancellables: Set<AnyCancellable> = []
    private let songsDataSurce: SongsDataSource
    private var timer: Timer? = nil
    
    init(songsDataSurce: SongsDataSource){
        self.songsDataSurce = songsDataSurce
    }
    
    
    
    func playStop(isPlaying: Bool){
        
        var count = 0
        if (isPlaying && timer == nil){
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
                count += 1
                self.progressSongValue = CGFloat(count)
                print(count)
                
            }
        }else if (!isPlaying){
            timer?.invalidate()
            timer = nil
            self.progressSongValue = CGFloat(0)
        }
    
    }
    
}
