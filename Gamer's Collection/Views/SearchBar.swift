//
//  SearchBar.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 25.01.2022.
//

import SwiftUI

struct SearchBar: View {
    @ObservedObject var viewModel: AddGameViewModel
    @Binding var text: String
    @State private var isEditing = false
    var body: some View {
        HStack {
            TextField("Search Game ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(white:0.8))
                .foregroundColor(.black)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            
                            Button {
                                text = ""
                            } label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
            
                .padding(.horizontal, 8)
                .onTapGesture {
                    isEditing = true
                }
                .onSubmit{
                    
                    Task{
                        await viewModel.fetchGames(viewModel.searchName)
                    }
                    
                }
                .submitLabel(.search)
            if isEditing{
                Button {
                        text = ""
                        isEditing = false
                    
                } label: {
                    withAnimation {
                        Text("Cancel")
                            .padding(.trailing, 10)
                            .transition(.move(edge: .trailing))
                            .font(.body)
                        
                    }
                }
            }
        }
        .animation(Animation.easeInOut(duration: 0.4), value: isEditing)
    }
}
