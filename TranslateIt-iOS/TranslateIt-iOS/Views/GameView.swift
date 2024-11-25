//
//  GameView.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 22/11/24.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        GeometryReader { geometry in
            let list2 = ["Hello", "World", "SwiftUI", "Is"]
            
            ZStack(alignment: .bottom){
                VStack{
                    Text("Translate It")
                        .font(.custom("PressStart2P-Regular", size: 24))
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .foregroundColor(.white)
                        .background(.darkMossGreen)
                    ZStack(alignment: .top){
                        Text("Score:\(viewModel.gameUiState.score)")
                            .font(.custom("PressStart2P-Regular", size: 18))
                            .frame(width: geometry.size.width * 0.6, height: 49)
                            .foregroundStyle(.white)
                            .background(.darkForestGreen)
                            .clipShape( RoundedRectangle(cornerRadius: 11))
                            .zIndex(1)

                        Text(viewModel.gameUiState.word)
                            .font(.custom("Lalezar-Regular", size: 64))
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.53)
                            .foregroundStyle(.white)
                            .background(.darkMossGreen)
                            .clipShape( RoundedRectangle(cornerRadius: 15))
                            .padding(.top, 20)
                            .shadow(radius: 4, x: 0, y: 4)
                        
                    }
                    Spacer()
                    
                }
                
                VStack(){
                    
                    ForEach(Array(stride(from: 0, to: viewModel.gameUiState.options.count, by: 2)), id: \.self) { index in
                        HStack {
                            Button(action: {
                                viewModel.checkAnswer(viewModel.gameUiState.options[index])
                            }) {
                                Text(viewModel.gameUiState.options[index])
                                    .font(.custom("PressStart2P-Regular", size: 14))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 62)
                                    .background(.darkForestGreen)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(.horizontal, 20)
                                    .padding(.vertical)
                                    .shadow(radius: 4, x: 0, y: 6)
                            }
                                
                            
                            if index + 1 < list2.count {
                                Button(action: {
                                    viewModel.checkAnswer(viewModel.gameUiState.options[index + 1])
                                }) {
                                    Text(viewModel.gameUiState.options[index + 1])
                                        .font(.custom("PressStart2P-Regular", size: 14))
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 62)
                                        .background(.darkForestGreen)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .padding(.horizontal, 20)
                                        .shadow(radius: 4, x: 0, y: 6)
                                }



                            }
                        }
                    }

                }.frame(maxWidth: .infinity).frame(
                    height: geometry.size.height * 0.3)
                .background(.leafGreen)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.black.opacity(0.4),
                            Color.clear
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 15),
                    alignment: .top
                )
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GameView()
}
