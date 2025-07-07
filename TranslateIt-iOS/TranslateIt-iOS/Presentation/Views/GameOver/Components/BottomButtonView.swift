//
//  BottomButtonView.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 25/11/24.
//

import SwiftUI

struct BottomButtonView: View {
    let title: String
    let action: () -> Void

    var body: some View {
        VStack {
            Button(action: action) {
                Text(title)
                    .font(.custom("", size: 18))
                    .foregroundColor(.white)
                    .frame(width: 280, height: 50)
                    .background(.darkForestGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
            }
            .padding(.bottom, 40)
        }
    }
}
