//
//  GameDetailView.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 26.01.2022.
//

import SwiftUI
import CachedAsyncImage

struct GameDetailView: View {
    var gameEntity: GameEntity
    var game: Game
    
    
    init(gameEntity: GameEntity) {
            
        
        self.gameEntity = gameEntity
        
        // Creating game model from gameEntity so that same Views can be used.
        
        var genres = [Genre]()
        
        for genre in gameEntity.genreArray {
            
            genres.append(Genre(name: genre.wrappedGenre))
        }

        var screenshots = [Screenshots]()
        
        for ss in gameEntity.wrappedScreenShots {
            screenshots.append(Screenshots(image: ss))
        }
        
        self.game = Game(name: gameEntity.wrappedName, released: gameEntity.wrappedReleaseDate, background_image: gameEntity.wrappedImageURL, genres: genres, short_screenshots: screenshots)
        
        
        
    }
    
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            ScrollView{
                VStack{

                    Text(game.name!)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    MultiImageSlider(game: game)
                        .scaledToFill()
                        .frame(maxWidth: .infinity)

                    
                    Text("Release Date: \(gameEntity.wrappedReleaseDate)")
                        .italic()
                        .foregroundColor(.white)
                    VStack(alignment: .leading) {
                        HStack{
                            
                            VStack(alignment: .leading){
                                Text("Genre")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                    .underline()
                                    .padding(.bottom, 3)
                                ForEach(game.unwrappedGenre) {genre in
                                    Text(genre.name)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 0.1)
                                }
                            }
                            
                            Spacer()
                            RatingView(rating: .constant(Int(gameEntity.starRating)))
                            
                            
                        }
                        .padding(20)
                        
                        
                    }
                    
                    if gameEntity.wrappedComment.count > 0 {
                        Text(gameEntity.wrappedComment)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(LinearGradient(gradient: Gradient(colors: [.purple, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .opacity(0.5)
                            .padding(20)
                    }
                    
                    
                }
            }
            
        }
        
    }
    
    
}
