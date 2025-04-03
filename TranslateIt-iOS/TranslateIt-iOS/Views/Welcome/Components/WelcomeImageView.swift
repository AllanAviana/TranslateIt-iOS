//
//  WelcomeImageView.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 25/11/24.
//

import SwiftUI

struct WelcomeImageView: View {
    let geometry: GeometryProxy
    @State private var isVisible = false
    
    var body: some View {
        Image("WelcomeImage")
            .resizable()
            .scaledToFit()
            .offset(x: isVisible ? 0 : -geometry.size.width)
            .onAppear {
                withAnimation(.easeOut(duration: 1)) {
                    isVisible = true
                }
            }
    }
}
