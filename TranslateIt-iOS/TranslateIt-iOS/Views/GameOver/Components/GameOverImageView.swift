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

    var body: some View {
        Image(imageName)
            .scaledToFit()
            .padding(.top, calculateTopPadding(for: geometry.size))
    }

    func calculateTopPadding(for size: CGSize) -> CGFloat {
        if size.height > 800 {
            return size.height * 0.13
        } else {
            return size.height * 0.08
        }
    }
}
