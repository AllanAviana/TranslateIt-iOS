//
//  GameOptionsView.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 25/11/24.
//

import SwiftUI

struct GameOptionsView: View {
    let options: [String]
    let geometry: GeometryProxy
    let action: (String) -> Void

    var body: some View {
        VStack {
            ForEach(
                Array(stride(from: 0, to: options.count, by: 2)), id: \.self
            ) { index in
                HStack {
                    GameOptionButton(
                        text: options[index],
                        action: { action(options[index]) }
                    )

                    if index + 1 < options.count {
                        GameOptionButton(
                            text: options[index + 1],
                            action: { action(options[index + 1]) }
                        )
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: geometry.size.height * 0.3)
        .background(.leafGreen)
        .overlay(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.black.opacity(0.4),
                    Color.clear,
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 15),
            alignment: .top
        )
    }
}
