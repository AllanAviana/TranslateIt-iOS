//
//  MessageView.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 25/11/24.
//

import SwiftUI

struct MessageView: View {
    var text: String = ""
    var body: some View {
        HStack {
            Text(text)
                .font(.custom("PottaOne-Regular", size: 18))
                .foregroundStyle(.mintGreen)
                .lineSpacing(8)
            Spacer()
        }
        .padding(.top, 1)
    }
}
