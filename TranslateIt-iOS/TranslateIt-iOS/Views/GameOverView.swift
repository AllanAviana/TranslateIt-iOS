//
//  GameOverView.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 25/11/24.
//

import SwiftUI

struct GameOverView: View {
    @EnvironmentObject var viewModel: ViewModel
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
                            Text(viewModel.gameOverUiState.message)
                                .font(.custom("PressStart2P-Regular", size: 32))
                                .foregroundStyle(.darkForestGreen)
                            Spacer()
                        }.padding(.top, 90)
                        
                        HStack {
                            Text(viewModel.gameOverUiState.sentence)
                                .font(.custom("PressStart2P-Regular", size: 14))
                                .foregroundStyle(.mintGreen)
                                .lineSpacing(8)
                            Spacer()
                        }.padding(.top, 20)
                        
                        Image(viewModel.gameOverUiState.image)
                            .scaledToFit()
                            .padding(.top, calculateTopPadding(for: geometry.size))
                        Spacer()
                            .navigationDestination(
                                isPresented: $viewModel.returnToWelcome
                            ) {
                                ContentView()
                            }
                        
                    }.padding(.horizontal, 30).zIndex(2)
                    
                    VStack {
                        Button(action: {
                            viewModel.resetGame()
                            
                        }) {
                            Text("Voltar")
                                .font(.custom("", size: 18))
                                .foregroundColor(.white)
                                .frame(width: 280, height: 50)
                                .background(.darkForestGreen) 
                                .clipShape(RoundedRectangle(cornerRadius: 100))
                        }
                        
                        .padding(.bottom, 40)

                        
                        
                    }.frame(maxWidth: .infinity).frame(
                        height: geometry.size.height * 0.35, alignment: .bottom).background(.limeGlow)
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
            }.navigationBarBackButtonHidden(true)
       
    }
}

func calculateTopPadding(for size: CGSize) -> CGFloat {
       if size.height > 800 {
           return size.height * 0.13
       } else {
           return size.height * 0.08
       }
   }

#Preview {
    GameOverView()
}
