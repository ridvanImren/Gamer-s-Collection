//
//  NoItemsView.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 26.01.2022.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate = false
    @Binding var isShowingSheet: Bool
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no games!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Click the add button and search games you want to add.")
                    .padding(.bottom, 50)
                Button {
                    isShowingSheet = true
                } label: {
                    Text("Add a Game")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.purple : Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? Color.purple.opacity(0.8) : Color.blue.opacity(0.8),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -5 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear {
                addAnimation()
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView(isShowingSheet: .constant(false))
                .navigationTitle("Gamer's Collection")

        }
    }
}
