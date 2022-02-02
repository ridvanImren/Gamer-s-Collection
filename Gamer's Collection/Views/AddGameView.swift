//
//  GameView.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 25.01.2022.
//

import SwiftUI


struct AddGameView: View {
    @ObservedObject var viewModel =  AddGameViewModel()
    
    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack{
                    SearchBar(viewModel: viewModel, text: $viewModel.searchName)
                        .animation(Animation.easeInOut(duration: 0.4), value: viewModel.isEditing)
                    
                    ScrollView{
                        VStack(alignment: .leading, spacing: 12){
                            ForEach(viewModel.games.data) { game in
                                    NavigationLink {
                                        AddGameDetailView(game: game)
                                    } label: {
                                        Text(game.name ?? "N/A")
                                            .font(.headline)
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                            .background(.purple)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                            .foregroundColor(.black)
                                        
                                            .padding(.horizontal)
                                        
                                    }
                            }
                        }
                        
                    }
                    Spacer()
                    
                }
            }
            .navigationTitle("Search & Add Game")
            .navigationBarTitleDisplayMode(.inline)
            
    }
    
    
    
    
}

