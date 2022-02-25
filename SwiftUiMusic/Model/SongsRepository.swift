//
//  SongsRepository.swift
//  SwiftUiMusic
//
//  Created by Antonio Carabantes Millán on 25/2/22.
//

import Foundation
import Combine
import SwiftUI


protocol SongsDataSource{
    func songs() -> AnyPublisher<[Song], Never>
}

struct SongsRepository: SongsDataSource{
    
    func songs() -> AnyPublisher<[Song], Never> {
        let data = [
        
            Song(title: "Curso de levitacion intensivo", coverAlbum: "https://i.scdn.co/image/ab67616d00001e025f30ba0541ae9d38390e5e44", artistName: "Bunbury"),
            Song(title: "We are chaos", coverAlbum: "https://i.scdn.co/image/ab67616d00001e02da0f0348712fba481c1761e3", artistName: "Marilyn Manson"),
            Song(title: "Power Up", coverAlbum: "https://i.scdn.co/image/ab67616d00001e0204db0e3bcd166c1d6cfd81f9", artistName: "AC/DC"),
            Song(title: "N.A.T.I.O.N", coverAlbum: "https://i.scdn.co/image/ab67616d00001e021289003f4068380088b64043", artistName: "Bad Wolves"),
            Song(title: "Bridges To Buenos Aires (Live)", coverAlbum: "https://i.scdn.co/image/ab67616d00001e02cc72fa5e108486e252044c19", artistName: "The Rolling Stones"),
            Song(title: "Letter to you", coverAlbum: "https://i.scdn.co/image/ab67616d00001e02e5e195e27f8995a9c03bf993", artistName: "Bruce Springsteen"),
            Song(title: "Free", coverAlbum: "https://i.scdn.co/image/ab67616d00001e02f057ae4f4cd28abd865cea13", artistName: "Iggy Pop"),
            Song(title: "Primrose path", coverAlbum: "https://i.scdn.co/image/ab67616d00001e0297c00ec71d328d024faf0528", artistName: "Dream State"),
            Song(title: "Circles", coverAlbum: "https://i.scdn.co/image/ab67616d00001e026b6c2594bb6a844637dbad1c", artistName: "P.O.D"),
            Song(title: "The new Abnormal", coverAlbum: "https://i.scdn.co/image/ab67616d00001e02bfa99afb5ef0d26d5064b23b", artistName: "The Strokes"),
            Song(title: "Still Sucks", coverAlbum: "https://i.scdn.co/image/ab67616d00001e027d51279f78e17fe253009f68", artistName: "Limp Bizkit"),
        ]
        
        return Just(data)
            .setFailureType(to: Never.self)
            .eraseToAnyPublisher()
    }
    
    
    static func previewView()-> Song{
       return  Song(title: "The new Abnormal", coverAlbum: "https://i.scdn.co/image/ab67616d00001e02bfa99afb5ef0d26d5064b23b", artistName: "The Strokes")
    }
    
    static func previewListView()-> [Song]{
       return [ Song(title: "The new Abnormal", coverAlbum: "https://i.scdn.co/image/ab67616d00001e02bfa99afb5ef0d26d5064b23b", artistName: "The Strokes"),
                Song(title: "Power Up", coverAlbum: "https://i.scdn.co/image/ab67616d00001e0204db0e3bcd166c1d6cfd81f9", artistName: "AC/DC"),
                Song(title: "N.A.T.I.O.N", coverAlbum: "https://i.scdn.co/image/ab67616d00001e021289003f4068380088b64043", artistName: "Bad Wolves"),
                Song(title: "Bridges To Buenos Aires (Live)", coverAlbum: "https://i.scdn.co/image/ab67616d00001e02cc72fa5e108486e252044c19", artistName: "The Rolling Stones")]
                
    }
}




struct Song: Identifiable{
    let id = UUID()
    let title: String
    let coverAlbum: String
    let artistName: String
}
