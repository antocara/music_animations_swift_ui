//
//  ContentView.swift
//  SwiftUiMusic
//
//  Created by Antonio Carabantes Millán on 24/2/22.
//

import SwiftUI

struct PlayerView: View {
    
    @State var song: Song
    
    @State private var isAnimating: Bool = false
    @State private var isAppearing: Bool = false
    
    
    private let screenWidth = UIScreen.main.bounds.width
    @StateObject var viewModel = PlayerViewModel(songsDataSurce: SongsRepository())
    
    
    
    var body: some View {
        
        ZStack(){
            BackgroundBlur(imageName: song.coverAlbum)
            VStack{
                cardCover()
                Spacer()
                player()
            }
        }
        .onAppear {
            isAppearing = true
        }.onDisappear {
            stopPlayer()
        }
        
    }
    
    fileprivate func stopPlayer(){
        viewModel.playStop(isPlaying: false)
        stopSoud()
    }
    
    fileprivate func startPlayer(){
        viewModel.playStop(isPlaying: true)
        playSound(sound: "music", type: "mp3")
    }
    
    fileprivate func cardCover() -> some View {
        
        return ZStack{
            WaveCircle(isAnimating: $isAnimating, opacity: 0.5, size: 160, scaleEffect: 2)
            WaveCircle(isAnimating: $isAnimating, opacity: 0.3, size: 190, scaleEffect: 3)
            
            CardCover(coverImage: song.coverAlbum)
                .opacity(isAppearing ? 1 : 0)
        }
        
    }
    
    
    fileprivate func player() -> some View {
        return ZStack(alignment: .bottomLeading){
            
            BoxPlayer(isAnimating: $isAnimating, progressValue: $viewModel.progressSongValue, isPlaying: $isAnimating, song: song){ event in
                switch(event){
                case .play:
                    isAnimating.toggle()
                    isAnimating ? startPlayer() : stopPlayer()
                case .forward:
                    return
                case .backward:
                    return
                }
                
            }
            .opacity(isAppearing ? 1 : 0)
            .offset(y: isAppearing ? 0 : 40)
            .animation(.easeOut(duration: 1), value: isAppearing)
            
            
            HStack{
                Spacer().frame(width: 30)
                CircularCover(imagePath: song.coverAlbum, isAnimating: isAnimating, isPlaying: isAnimating)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
            .opacity(isAppearing ? 1 : 0)
            .offset(y: isAppearing ? 0 : 140)
            .animation(.easeOut(duration: 1), value: isAppearing)
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PlayerView(song: SongsRepository.previewView())
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(song: SongsRepository.previewView())
        
    }
}








