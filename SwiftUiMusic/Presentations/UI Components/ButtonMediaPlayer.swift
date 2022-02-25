//
//  ButtonMediaPlayer.swift
//  SwiftUiMusic
//
//  Created by Antonio Carabantes Millán on 25/2/22.
//

import SwiftUI

struct ButtonMediaPlayer: View {
    
    let iconName: String
    let iconNamePressed: String
    let iconSize: CGFloat
    var buttonClicked: () -> Void
    @State private var isPlaying: Bool = false
    
    var body: some View {
        Button {
            buttonClicked()
            isPlaying.toggle()
        } label: {
            Image(systemName: isPlaying ? iconNamePressed : iconName)
                .resizable()
                .frame(width: iconSize, height: iconSize)
                .scaledToFit()
                .tint(Color.black)
        }.buttonStyle(CustomizeWithPressed())
    }
}


struct CustomizeWithPressed: ButtonStyle {
    typealias Body = Button
    let padding = 15.00
    
    func makeBody(configuration: Self.Configuration) -> some View {
        if configuration.isPressed {
            return configuration
                .label
                .padding(padding)
                .background(Color.onPressedButtonMediaPlayer)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } else {
            return configuration
                .label
                .padding(padding)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct ButtonMediaPlayer_Previews: PreviewProvider {
    static var previews: some View {
        ButtonMediaPlayer(iconName: "play.fill", iconNamePressed: "pause.fill", iconSize: 30, buttonClicked: {})
    }
}
