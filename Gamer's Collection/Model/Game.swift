//
//  Game.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 25.01.2022.
//

import Foundation

struct Output: Codable {
    var results: [Game]
}

struct Game: Codable, Identifiable {
    let id = UUID()
    var name: String?
    var released: String?
    var unwrappedReleaseDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-MM-dd"
        let date = dateFormatter.date(from: released ?? "2011-05-16") ?? Date.now
        return date.formatted(date: .abbreviated, time: .omitted)
    }
    var background_image: String?
    var genres: [Genre]?
    var unwrappedGenre: [Genre] {
        genres ?? [Genre(name: "")]
    }

    static let example = Game(name: "Terraria", released: "2011-05-16", background_image: "https://media.rawg.io/media/games/91c/91c4f377c1e09755b60a0102c5252843.jpg", genres:[ Genre(name: "Platformer"), Genre(name: "Indie"), Genre(name: "Action")]
    )
}

struct Genre: Codable, Identifiable {
    let id = UUID()
    var name: String
}

struct Games: Codable {
    var data: [Game]
}
