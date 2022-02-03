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

    var short_screenshots: [Screenshots]?
    
    var unwrappedScreenshots: [Screenshots] {
        short_screenshots ?? [Screenshots(image: background_image!)]
    }
    

    static let example = Game(
        name: "Terraria",
        released: "2011-05-16",
        background_image: "https://media.rawg.io/media/games/91c/91c4f377c1e09755b60a0102c5252843.jpg",
        genres:[ Genre(name: "Platformer"), Genre(name: "Indie"), Genre(name: "Action")],
        short_screenshots: [Screenshots(image: "https://media.rawg.io/media/games/da1/da1b267764d77221f07a4386b6548e5a.jpg"),
                           Screenshots(image: "https://media.rawg.io/media/screenshots/d7c/d7c05cdfb30ec07147bcd0d3985ec54c.jpg"),
                           Screenshots(image: "https://media.rawg.io/media/screenshots/479/479cb74c874748ca70a3a14e79a0c232.jpg"),
                           Screenshots(image: "https://media.rawg.io/media/screenshots/070/0703edc6d3db345a3acf19b4e6e43ebd.jpg"),
                           Screenshots(image: "https://media.rawg.io/media/screenshots/e4f/e4feaf5b078949102e72780091eb12af.jpg"),
                           Screenshots(image: "https://media.rawg.io/media/screenshots/028/02863a140eea53c1f51fd790aca753aa.jpg"),
                           Screenshots(image: "https://media.rawg.io/media/screenshots/8d2/8d2c0bb90867031f9265ef62c01445c5.jpg")]
    )
}

struct Genre: Codable, Identifiable {
    let id = UUID()
    var name: String
}

struct Screenshots: Codable, Identifiable {
    let id = UUID()
    var image: String
}

struct Games: Codable {
    var data: [Game]
}
