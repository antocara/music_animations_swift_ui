//
//  BoxPlayer.swift
//  SwiftUiMusic
//
//  Created by Antonio Carabantes Millán on 25/2/22.
//

import SwiftUI


typealias OnPlayerClicked = (OnPlayerClickedEvent) -> Void

struct BoxPlayer: View {
    
    @Binding var isAnimating: Bool
    @Binding var progressValue: CGFloat
    @Binding var isPlaying: Bool
    @State var song: Song
    let onPlayerClick: OnPlayerClicked

    
    
   
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        VStack(spacing: 0){
            boxProgressPlayer(song: song, screenWidth: screenWidth, progressValue: progressValue)
                .opacity(isPlaying ? 1 : 0)
                .offset(y: isPlaying ? 0 : 70)
                .animation(.easeOut(duration: 1), value: isPlaying)
            boxMediaPlayerButtons(screenWidth: screenWidth, onPlayerClick: onPlayerClick)
        }
    }
}


fileprivate func boxProgressPlayer(song: Song, screenWidth: CGFloat, progressValue: CGFloat) -> some View{
    HStack(){
        ZStack{
            Rectangle().fill(Color.white).opacity(0.7)
            VStack(alignment: .leading){
                Text(song.title)
                    .font(.body)
                    .foregroundColor(Color.black)
                
                Text(song.artistName)
                    .font(.caption)
                    .foregroundColor(.titleTextColor)
                
                
                ProgressView(value: progressValue, total: 500)
                    .tint(.progressPlayer)
                    .frame(width: screenWidth - 200)
            }
            .frame(width: screenWidth - 180)
            .padding(EdgeInsets(top: 0, leading: 100, bottom: 5, trailing: 0))
        }
    }
    .frame(width: screenWidth - 80, height: 80)
    .cornerRadius(8, corners: [.topLeft, .topRight])
}

fileprivate func boxMediaPlayerButtons(screenWidth: CGFloat, onPlayerClick: @escaping OnPlayerClicked ) -> some View{
    HStack(spacing: 10){
        Spacer()
        ButtonMediaPlayer(iconName: "backward.fill", iconNamePressed: "backward.fill", iconSize: 20, buttonClicked: {
            onPlayerClick(.backward)
        })
        ButtonMediaPlayer(iconName: "play.fill", iconNamePressed: "pause.fill", iconSize: 30, buttonClicked: {
            onPlayerClick(.play)
        })
        ButtonMediaPlayer(iconName: "forward.fill", iconNamePressed: "forward.fill", iconSize: 20, buttonClicked: {
            onPlayerClick(.forward)
        })
        Spacer().frame(width: 10)
    }
    .frame(width: screenWidth - 50, height: 70)
    .background(Color.white)
    .cornerRadius(8)
}


enum OnPlayerClickedEvent{
    case play
    case backward
    case forward
}


struct BoxPlayer_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
            BoxPlayer(isAnimating: .constant(false), progressValue: .constant(CGFloat(234)),
                      isPlaying: .constant(true),
                      song: SongsRepository.previewView(),
                      onPlayerClick: { _ in})
        }
    }
}

