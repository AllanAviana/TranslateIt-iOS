//
//  GameOptionButton.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 25/11/24.
//
import SwiftUI

struct GameOptionButton: View {
    let text: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.custom("PressStart2P-Regular", size: 14))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 62)
                .background(.darkForestGreen)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 20)
                .padding(.vertical)
                .shadow(radius: 4, x: 0, y: 6)
        }
    }
}
