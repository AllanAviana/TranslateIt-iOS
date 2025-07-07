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
                .font(.custom("PottaOne-Regular", size: 32))
                .foregroundStyle(.darkForestGreen)
            Spacer()
        }
        
        HStack{
            Text(text)
                .font(.custom("PottaOne-Regular", size: 24))
                .foregroundStyle(.darkForestGreen)
            Spacer()
        }.padding(.top, 30)
    }
}
