//
//  AddGameViewModel.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 26.01.2022.
//

import Foundation

@MainActor class AddGameViewModel: ObservableObject {
    @Published var games = Games(data: [Game]())
    @Published var searchName = ""
    @Published var isEditing = false
    
    func fetchGames(_ name: String) async {
        let name = searchName.components(separatedBy: .whitespacesAndNewlines).joined(separator: "%20")
        print(name)
        
        let urlString = "https://api.rawg.io/api/games?key=d8986e4c3c034008a6c7b9782bed45a6&search=\(name)&search_exact=true&platforms=4&stores=1"
        
        
        guard let url = URL(string: urlString) else {
            print("URL cannot be created from \(urlString)")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let output = try JSONDecoder().decode(Output.self, from: data)
            games.data = output.results
            
            
            
            
        } catch {
            print("N/A")
        }
    }
    
}
