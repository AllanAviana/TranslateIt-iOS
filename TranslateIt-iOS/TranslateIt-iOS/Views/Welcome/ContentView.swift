//
//  ContentView.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 22/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                
                ZStack(alignment: .bottom) {
                    Color(.paleGreen)
                        .ignoresSafeArea()
                    
                    VStack {
                        HeaderView(text: "Bem-Vindo!")
                        
                        MessageView(text: "Adivinhe a traducao correta da palavra em ingles e ganhe pontos!")
                        
                        WelcomeImageView(geometry: geometry)
                        Spacer()
                        
                    }.padding(.horizontal, 30).zIndex(2)
                    
                    VStack {
                        WelcomeNavigationView()
                        
                    }.frame(maxWidth: .infinity).frame(
                        height: geometry.size.height * 0.35, alignment: .bottom).background(.limeGlow)
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }.navigationBarBackButtonHidden(true)
        }
    }
}
