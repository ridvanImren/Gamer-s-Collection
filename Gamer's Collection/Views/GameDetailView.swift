//
//  GameDetailView.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 26.01.2022.
//

import SwiftUI

struct GameDetailView: View {
    var game: GameEntity
    
    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                ScrollView{
                    VStack{
                        Group {
                            if let imageURLString = game.imageURL {
                                if let imageURL = URL(string: imageURLString) {
                                    AsyncImage(url: imageURL) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()

                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                        Text("Release Date: \(game.wrappedReleaseDate)")
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
                                    ForEach(game.genreArray) {genre in
                                        Text(genre.wrappedGenre)
                                            .foregroundColor(.white)
                                            .padding(.bottom, 0.1)
                                    }
                                }
                                
                                Spacer()
                                RatingView(rating: .constant(Int(game.starRating)))
                                
                                
                            }
                            .padding(20)
                            
                            
                        }
                        
                        
                        Text(game.wrappedComment)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(LinearGradient(gradient: Gradient(colors: [.purple, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .opacity(0.5)
                            .padding(20)
                    }
                }
                .navigationTitle(game.wrappedName)
                .navigationBarTitleDisplayMode(.inline)
                
            }
            
    }
    
    
}
