//
//  AddGameViewModel.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 26.01.2022.
//

import Foundation
import Combine

@MainActor class AddGameViewModel: ObservableObject {
    @Published var games = Games(data: [Game]())
    @Published var searchName = ""
    @Published var isEditing = false
    
    func fetchGames(_ name: String) async {
        let name = searchName.components(separatedBy: .whitespacesAndNewlines).joined(separator: "%20")
        print(name)
        
        let urlString = "https://api.rawg.io/api/games?key=d8986e4c3c034008a6c7b9782bed45a6&search=\(name)&search_exact=true&platforms=4&stores=1"
        
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap( handleOutput )
            .decode(type: Output.self, decoder: JSONDecoder())
            .sink { (completion) in
                
                // Handling completion
                switch completion {
                case .failure(let error):
                    print("There was an error. \(error)")
                case .finished:
                    print("Finished Completion")
                }
                
            } receiveValue: { [weak self] (returnedGames) in
                self?.games.data = returnedGames.results
            }
        
        
        func handleOutput(output: Publishers.SubscribeOn<URLSession.DataTaskPublisher, DispatchQueue>.Output) throws -> Data {
            
            guard
                let response = output.response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
            return output.data
            
        }

    }
    
    
    
    
}
