//
//  AddGameDetailView.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 26.01.2022.
//

import SwiftUI

struct AddGameDetailView: View {
    
    @ObservedObject var viewModel: GameDetailViewModel
    var body: some View {
               
        
        NavigationView  {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                ScrollView{
                    VStack{
                        ZStack {
                        Text(viewModel.game.name!)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            HStack {
                                Spacer()
                                Button {
                                    viewModel.save(game: viewModel.game)
                                } label: {
                                    Text("Save")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.trailing, 15)

                                }
                            }
                        }
                        
                        Group {
                            if let imageURLString = viewModel.game.background_image {
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
                        
                        
                        TextField("Comments", text: $viewModel.comment)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(gradient: Gradient(colors: [.purple, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .opacity(0.5)
                            .padding(20)
                            
                        
                    }
                }
                .navigationBarHidden(true)
            }
            
        }
    }
    
    init(game: Game) {
        self._viewModel = ObservedObject(wrappedValue: GameDetailViewModel(game: game))
    }
    
}
