//
//  TranslateIt_iOSTests.swift
//  TranslateIt-iOSTests
//
//  Created by Allan Viana on 22/11/24.
//

import Testing
@testable import TranslateIt_iOS

struct ViewModelTests {

    // MARK: - Mocks -------------------------------------------------------

    let q1 = QuestionState(
        word: "dog",
        options: ["cachorro", "gato", "pássaro"],
        correctAnswer: "cachorro"
    )
    let q2 = QuestionState(
        word: "cat",
        options: ["gato", "cavalo", "vaca"],
        correctAnswer: "gato"
    )

    // MARK: - Testes ------------------------------------------------------

    @Test("startGame inicializa a primeira palavra")
    func startGame_setsFirstWord() throws {
        let sut = ViewModel(mockQuestions: [q1, q2])

        #expect(sut.gameUiState.word == "dog")
        #expect(sut.gameUiState.options.count == 3)
        #expect(!sut.gameUiState.isGameOver)
    }

    @Test("responder certo soma 10 pontos e prossegue")
    func checkAnswer_correct_increasesScore() throws {
        let sut = ViewModel(mockQuestions: [q1, q2])

        sut.checkAnswer("cachorro")

        #expect(sut.gameUiState.score == 10)
        #expect(sut.questions.count == 1)          // removeu q1
        #expect(!sut.gameUiState.isGameOver)
    }

    @Test("responder errado encerra o jogo")
    func checkAnswer_wrong_endsGame() throws {
        let sut = ViewModel(mockQuestions: [q1, q2])

        sut.checkAnswer("gato")                    // resposta errada

        #expect(sut.gameUiState.isGameOver)
    }

    @Test("resetGame limpa placar e reinicia")
    func resetGame_restarts() throws {
        let sut = ViewModel(mockQuestions: [q1])

        sut.checkAnswer("gato")                    // erra, game over
        sut.resetGame()

        #expect(!sut.gameUiState.isGameOver)
        #expect(sut.gameUiState.score == 0)
        
    }
}



