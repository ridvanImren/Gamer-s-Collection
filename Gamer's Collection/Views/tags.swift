//
//  tags.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 26.01.2022.
//
import SwiftUI

struct tags: View {
    var tags: Array<String>
    var body: some View {
        HStack {
        ForEach(tags, id: \.self) { e in
            Text(e)
                .foregroundColor(.pink)
                .font(.system(size: 10))
                .padding(4)
                .overlay(
                   RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.pink, lineWidth: 0.5)
               )
           }
        }
    }
}
