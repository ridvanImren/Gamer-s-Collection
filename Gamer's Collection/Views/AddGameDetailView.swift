//
//  AddGameDetailView.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 26.01.2022.
//

import SwiftUI

struct AddGameDetailView: View {
    
    @ObservedObject var viewModel: AddGameDetailViewModel
    var body: some View {
        
        
        NavigationView  {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                ScrollView{
                    VStack{
                        
                            Text(viewModel.game.name!)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        
                        
                        MultiImageSlider(game: viewModel.game)
                            .scaledToFill()
                            .frame(maxWidth: .infinity)

                        Text("Release Date: \(viewModel.game.unwrappedReleaseDate)")
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
                                    ForEach(viewModel.game.unwrappedGenre) {genre in
                                        Text(genre.name)
                                            .foregroundColor(.white)
                                            .padding(.bottom, 0.1)
                                    }
                                }
                                
                                Spacer()
                                RatingView(rating: $viewModel.userRating)
                                
                                
                            }
                            .padding(20)
                            
                            
                        }
                        
                        
                        
                        VStack(alignment: .leading) {
                            Text("Comments:")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .underline()
                                .padding(.horizontal, 20)
                                .padding(.top, 20)
                            
                            TextField("", text: $viewModel.comment)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(LinearGradient(gradient: Gradient(colors: [.purple, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .opacity(0.5)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 20)
                            
                            Button {
                                viewModel.save(game: viewModel.game)
                            } label: {
                                Text("Add to Favorites")
                                    .withDefaultButtonFormatting(backgroundcolor: Color(red: 0.6, green: 0.15, blue: 0.7))
                            }
                            .withPressableStyle(scaledAmount: 0.95)
                            
                        }
                        
                    }
                }
                .navigationBarHidden(true)
            }
            
        }
    }
    
    init(game: Game) {
        self._viewModel = ObservedObject(wrappedValue: AddGameDetailViewModel(game: game))
    }
    
}



struct AddGameDetailView_Previews: PreviewProvider {
    static let exUrlStrings = ["https://media.rawg.io/media/games/91c/91c4f377c1e09755b60a0102c5252843.jpg",
                               "https://media.rawg.io/media/screenshots/3af/3afd69426804e7162edbe03cd9f8d0f4.jpg",
                               "https://media.rawg.io/media/screenshots/48c/48c7e3e1268467b91b24c7da7c6539df.jpg"]
    
    static var previews: some View {
        AddGameDetailView(game: Game.example)
        
    }
}
