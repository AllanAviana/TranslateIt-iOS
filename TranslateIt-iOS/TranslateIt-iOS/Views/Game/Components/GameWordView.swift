//
//  GameWordView.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 25/11/24.
//

import SwiftUI

struct GameWordView: View {
    let score: Int
    let word: String
    let geometry: GeometryProxy

    var body: some View {
        ZStack(alignment: .top) {
            Text("Score: \(score)")
                .font(.custom("PressStart2P-Regular", size: 18))
                .frame(width: geometry.size.width * 0.6, height: 49)
                .foregroundStyle(.white)
                .background(.darkForestGreen)
                .clipShape(RoundedRectangle(cornerRadius: 11))
                .zIndex(1)

            Text(word)
                .font(.custom("Lalezar-Regular", size: 64))
                .frame(
                    width: geometry.size.width * 0.9,
                    height: geometry.size.height * 0.53
                )
                .foregroundStyle(.white)
                .background(.darkMossGreen)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.top, 20)
                .shadow(radius: 4, x: 0, y: 4)
        }
    }
}
