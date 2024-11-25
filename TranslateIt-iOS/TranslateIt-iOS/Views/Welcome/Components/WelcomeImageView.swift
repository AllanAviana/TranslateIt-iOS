//
//  WelcomeImageView.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 25/11/24.
//

import SwiftUI

struct WelcomeImageView: View {
    let geometry: GeometryProxy
    
    var body: some View {
        Image("WelcomeImage")
            .scaledToFit()
            .padding(.top, geometry.size.height * 0.13)
    }
}

