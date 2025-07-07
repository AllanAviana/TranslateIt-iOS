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
                    HeaderView(text: viewModel.gameOverUiState.message)

                    MessageView(text: viewModel.gameOverUiState.sentence)

                    GameOverImageView(
                        imageName: viewModel.gameOverUiState.image,
                        geometry: geometry
                    )

                    Spacer()
                        .navigationDestination(
                            isPresented: $viewModel.returnToWelcome
                        ) {
                            ContentView()
                        }
                }
                .padding(.horizontal, 30)
                .zIndex(2)

                BottomButtonView(
                    title: "Voltar",
                    action: viewModel.resetGame
                )
                .frame(maxWidth: .infinity)
                .frame(
                    height: geometry.size.height * 0.35,
                    alignment: .bottom
                )
                .background(.limeGlow)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarBackButtonHidden(true)
        }
    }
}

