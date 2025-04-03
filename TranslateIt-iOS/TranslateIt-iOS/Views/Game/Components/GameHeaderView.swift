//
//  GameHeaderView.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 25/11/24.
//

import SwiftUI

struct GameHeaderView: View {
    var body: some View {
        Text("Translate It")
            .font(.custom("PottaOne-Regular", size: 24))
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .foregroundColor(.white)
            .background(.darkMossGreen)
    }
}
