//
//  GameDetailViewModel.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 26.01.2022.
//

import Foundation
@MainActor class AddGameDetailViewModel: ObservableObject {
    @Published var game: Game
    @Published var userRating = 3
    @Published var comment = ""
    
    
    func save(game: Game) {
        
        let newGame = GameEntity(context: DataController.shared.viewContext)
        newGame.id = UUID()
        newGame.name = game.name!
        newGame.releaseDate = game.unwrappedReleaseDate
        newGame.starRating = Int16(userRating)
        newGame.imageURL = game.background_image
        newGame.comment = comment
        
        var ssImageStrings = [String]()
        for ss in game.unwrappedScreenshots {
            ssImageStrings.append(ss.image)
        }
        
        newGame.screenShots = ssImageStrings
        
        for genre in game.unwrappedGenre {
            let newGenre = GenreEntity(context: DataController.shared.viewContext)
            newGenre.genre = genre.name
            newGenre.game = newGame
        }
        
        DataController.shared.save()
    }
    
    init(game: Game) {
        self.game = game
    }
}
