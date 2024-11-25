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
            ZStack(alignment: .bottom) {
                VStack {
                    GameHeaderView()

                    GameWordView(
                        score: viewModel.gameUiState.score,
                        word: viewModel.gameUiState.word,
                        geometry: geometry
                    )

                    Spacer()
                        .navigationDestination(
                            isPresented: $viewModel.gameUiState.isGameOver
                        ) {
                            GameOverView()
                        }
                }

                GameOptionsView(
                    options: viewModel.gameUiState.options,
                    geometry: geometry,
                    action: viewModel.checkAnswer
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarBackButtonHidden(true)
        }
    }
}
