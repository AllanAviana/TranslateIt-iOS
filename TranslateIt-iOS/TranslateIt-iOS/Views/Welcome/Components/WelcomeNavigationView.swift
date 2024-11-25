//
//  WelcomeNavigationView.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 25/11/24.
//

import SwiftUI

struct WelcomeNavigationView: View {
    var body: some View {
        NavigationLink( destination: GameView()){
            Text("Jogar")
                .font(.custom("", size: 18 ))
                .foregroundStyle(Color.white)
            
                .frame(width: 280,height: 50)
                .background(.darkForestGreen)
                .clipShape(RoundedRectangle(cornerRadius: 100))
            
        }.padding(.bottom,40 )
    }
}
