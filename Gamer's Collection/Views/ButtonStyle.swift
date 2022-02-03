//
//  ButtonStyle.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 3.02.2022.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {

    let cornerRadius: Int = 10
    
    let backgroundcolor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundcolor)
            .cornerRadius(CGFloat(cornerRadius))
            .shadow(radius: 10)
            .padding()
    }

}

extension View {
    func withDefaultButtonFormatting(backgroundcolor: Color = .blue) -> some View {
        
        modifier(DefaultButtonViewModifier(backgroundcolor: backgroundcolor))
    }
}

struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount : CGFloat
    
    init(scaledAmount: CGFloat) {
        self.scaledAmount = scaledAmount
    }
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        withAnimation {
            configuration.label
                .opacity(configuration.isPressed ? 0.7 : 1)
                .scaleEffect(configuration.isPressed ? scaledAmount : 1)
        }
    }
}

extension View {
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct ButtonStyleView: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click Me")
                .withDefaultButtonFormatting(backgroundcolor: .purple)
        }
        .withPressableStyle(scaledAmount: 0.95)
        
    }
}

struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleView()
    }
}
