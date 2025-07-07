//
//  GameOverImageView.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 25/11/24.
//

import SwiftUI

struct GameOverImageView: View {
    let imageName: String
    let geometry: GeometryProxy
    @State private var isVisible = false

    var body: some View {
        Image(imageName)
            .scaledToFit()
            .animation(.none, value: isVisible)
            .opacity(isVisible ? 1 : 0)
            .animation(.easeIn(duration: 1.2), value: isVisible)
            .onAppear {
                isVisible = true
            }
            .padding(.top, calculateTopPadding(for: geometry.size))
    }

    func calculateTopPadding(for size: CGSize) -> CGFloat {
        return size.height > 800 ? size.height * 0.13 : size.height * 0.08
    }
}
