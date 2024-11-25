//
//  HeaderView.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 25/11/24.
//

import SwiftUI

struct HeaderView: View {
    var text: String = ""
    var body: some View {
        HStack {
            Text("TranslateIt")
                .font(.custom("PressStart2P-Regular", size: 14))
                .foregroundStyle(.darkForestGreen)
            Spacer()
        }
        
        HStack{
            Text(text)
                .font(.custom("PressStart2P-Regular", size: 32))
                .foregroundStyle(.darkForestGreen)
            Spacer()
        }.padding(.top, 80)
    }
}
