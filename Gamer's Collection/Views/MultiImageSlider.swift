//
//  MultiImageSlider.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 3.02.2022.
//

import SwiftUI
import CachedAsyncImage

struct MultiImageSlider: View {
    let game: Game


    var body: some View {
        // TabView for displaying multiple images fetched from the API.
        
        ZStack {
            ForEach(game.unwrappedScreenshots) { urlString in
                cachedImage(urlString: urlString.image)
                    .opacity(0)
            }
            
        TabView {
            ForEach(game.unwrappedScreenshots) { urlString in
                cachedImage(urlString: urlString.image)
                    .padding(2)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
    }
    
}

struct MultiImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        MultiImageSlider(game: Game.example)
            .background(.gray)
    }
}

extension MultiImageSlider {
    // For displaying an async image from given string.
    private func cachedImage(urlString: String) -> some View {
        Group {
            if let imageURLString = urlString {
                if let imageURL = URL(string: imageURLString) {
                    
                    CachedAsyncImage(url: imageURL, urlCache: .imageCache) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                        
                    } placeholder: {
                        ProgressView()
                        
                    }
                }
            }
            
        }
    }

}


