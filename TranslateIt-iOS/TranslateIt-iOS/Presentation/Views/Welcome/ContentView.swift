//
//  ContentView.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 22/11/24.
//

import SwiftUI

struct ContentView: View {
    let buttonHeight: CGFloat = 80
    @State private var buttonOffset: CGFloat = 0
    @State private var showSecondScreen = false

    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack(alignment: .bottom) {
                    Color(.paleGreen)
                        .ignoresSafeArea()
                    
                    VStack {
                        HeaderView(text: "Bem-Vindo!")
                        
                        MessageView(text: "Adivinhe a traducao correta\nda palavra em ingles e ganhe\npontos!")
                        
                        WelcomeImageView(geometry: geometry)
                        Spacer()
                        
                    }.padding(.horizontal, 30).zIndex(2)
                    
                    VStack {
                        ZStack {
                            Capsule()
                                .fill(Color("LeafGreen").opacity(0.2))
                            
                            Capsule()
                                .fill(Color("LeafGreen").opacity(0.2))
                                .padding(8)
                            
                            Text("Jogar")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.white)
                            
                            HStack {
                                    Capsule()
                                            .fill(Color("LeafGreen"))
                                            .frame(width: buttonOffset + buttonHeight)

                                    Spacer()
                            }
                            
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(Color("LeafGreen"))
                                    
                                    Circle()
                                        .fill(Color("DarkMossGreen"))
                                        .padding(8)
                                    
                                    Image(systemName: "chevron.right.2")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundColor(.white)
                                }.offset(x: buttonOffset)
                                
                                Spacer()
                            }
                            .gesture(
                                DragGesture()
                                    .onChanged({ gesture in
                                        if gesture.translation.width >= 0 && buttonOffset <= (geometry.size.width - 60) - buttonHeight {
                                            withAnimation(.easeInOut(duration: 0.25)) {
                                                buttonOffset = gesture.translation.width
                                            }
                                        }
                                    })
                                    .onEnded({ _ in
                                            if buttonOffset > (geometry.size.width - 60) / 2 {
                                                showSecondScreen = true
                                            } else {
                                                    withAnimation(.easeInOut(duration: 0.25)) {
                                                            buttonOffset = 0
                                                    }
                                            }
                                    })
                            )
                            
                            
                        }
                        .frame(width: geometry.size.width - 60, height: buttonHeight)
                        .padding(.top,160)

                        Spacer()
                    }
                    .frame(maxWidth: .infinity).frame(height: geometry.size.height * 0.35, alignment: .bottom)
                    .background(.limeGlow)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .fullScreenCover(isPresented: $showSecondScreen) {
                    GameView()
            }
            }.navigationBarBackButtonHidden(true)
        }
    }
}
