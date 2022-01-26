//
//  GameListView.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 26.01.2022.
//

import SwiftUI


struct GameListView: View {
    @State private var isShowingSheet = false
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var games: FetchedResults<GameEntity>
    
    var body: some View {
        NavigationView {
            ZStack {
                if games.isEmpty {
                    NoItemsView(isShowingSheet: $isShowingSheet)
                    
                } else {
                    List {
                        ForEach(games) { game in
                            NavigationLink{
                                GameDetailView(game: game)
                            } label: {
                                HStack {
                                    Text(game.wrappedName)
                                        .bold()
                                        .font(.subheadline)
                                        .lineLimit(1)
                                    Spacer()
                                    VStack(alignment: .leading, spacing: 8) {
                                        tags(tags: getGenres(game: game))
                                    }
                                    
                                }
                                
                            }
                            
                            
                        }
                        .onDelete(perform: deleteBooks)
                    }
                }
            }
            .listStyle(DefaultListStyle())
            .toolbar {
                Button{
                    isShowingSheet = true
                    
                } label: {
                    //                        Image(systemName: "plus")
                    Label("Add Game", systemImage: "plus.circle.fill")
                }
            }
            .sheet(isPresented: $isShowingSheet) {
                AddGameView()
            }
            .navigationTitle("Gamer's Collection")
        }
    }
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let game = games[offset]
            DataController.shared.viewContext.delete(game)
        }
        
        DataController.shared.save()
    }
    
    func getGenres(game: GameEntity) -> [String] {
        var genres = [String]()
        
        for genre in game.genreArray {
            genres.append(genre.wrappedGenre)
        }
        if genres.count > 1 {
            return [genres[0], genres[1]]
        } else {
            return genres
        }
    }
}
