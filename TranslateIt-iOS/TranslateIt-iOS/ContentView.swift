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
            ZStack(alignment: .bottom) {
                Color(.paleGreen)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("TranslateIt")
                            .font(.custom("PressStart2P-Regular", size: 14))
                            .foregroundStyle(.darkForestGreen)
                        Spacer()
                    }
                                        
                    HStack{
                        Text("Bem-vindo!")
                            .font(.custom("PressStart2P-Regular", size: 32))
                            .foregroundStyle(.darkForestGreen)
                        Spacer()
                    }.padding(.top, 90)
                    
                    HStack {
                        Text("Adivinhe a traducao correta da palavra em ingles e ganhe pontos!")
                            .font(.custom("PressStart2P-Regular", size: 14))
                            .foregroundStyle(.mintGreen)
                            .lineSpacing(8)
                        Spacer()
                    }.padding(.top, 20)
                                        
                    Image("WelcomeImage")
                        .scaledToFit()
                        .padding(.top, geometry.size.height * 0.13)
                    Spacer()
                                        
                }.padding(.horizontal, 30).zIndex(2)
              
                VStack {
                    Button(action: {
                        
                    }
                    ){
                        Text("Jogar")
                            .font(.custom("", size: 18 ))
                            .foregroundStyle(Color.white)
                           
                            .frame(width: 280,height: 50)
                            .background(.darkForestGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 100))
                            
                    }.padding(.bottom,40 )
                    
   
                }.frame(maxWidth: .infinity).frame(
                        height: geometry.size.height * 0.35, alignment: .bottom).background(.limeGlow)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    ContentView()
}
