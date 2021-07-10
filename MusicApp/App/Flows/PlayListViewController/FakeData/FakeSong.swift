//
//  FakeSongs.swift
//  MusicApp
//
//  Created by Ilyas Tyumenev on 10.07.2021.
//

import Foundation

class FakeSong {
    static func getSong() -> [Song] {
        let songs = [
            Song(
                name: "Speechless",
                albumName: "40 tubes été 2019",
                artistName: "Robin Schulz",
                imageName: "cover1",
                trackName: "song1"
            ),
            Song(
                name: "Me",
                albumName: "Lover",
                artistName: "Taylor_Swift",
                imageName: "cover2",
                trackName: "song2"
            ),
            Song(
                name: "Wake Me Up",
                albumName: "True",
                artistName: "Avicii",
                imageName: "cover3",
                trackName: "song3"
            )
        ]
        return songs
    }
}
