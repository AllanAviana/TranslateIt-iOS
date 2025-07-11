//
//  ViewModel.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 25/11/24.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var gameUiState: GameUiState = GameUiState()
    @Published var gameOverUiState: GameOverUiState = GameOverUiState()
    var questions: [QuestionState] = []
    var returnToWelcome: Bool = false
    
    init(){
        startGame()
    }
    
    func startGame() {
        questions = gameQuestions.shuffled()
        gameUiState.word = questions[0].word
        gameUiState.options = questions[0].options.shuffled()
        print(gameUiState.isGameOver)
    }
    
    func updateGame(){
        if questions.isEmpty {
            gameUiState.isGameOver = true
            updateGameOverUiState()
            return
        }else {
            gameUiState.word = questions[0].word
            print(gameUiState.isGameOver)

            gameUiState.options = questions[0].options.shuffled()
        }
    }
    
    func checkAnswer(_ answer: String){
        if answer == questions[0].correctAnswer {
            gameUiState.score += 10
            questions.remove(at: 0)
            updateGame()
        }else {
            gameUiState.isGameOver = true
            updateGameOverUiState()
            print("Game Over Ativado: \(gameUiState.isGameOver)")
        }
    }
    
    func resetGame(){
        returnToWelcome = true
        gameUiState.isGameOver = false
        gameUiState.score = 0
        startGame()
        print(gameUiState.isGameOver)
    }
    
    func checkImage(){
        if gameUiState.score >= 50 {
            gameOverUiState.image = "HappyEnd"
        }else {
            gameOverUiState.image = "BadEnd"
        }
    }
    func checkSentence(){
        if gameUiState.score >= 50 {
            gameOverUiState.sentence = "Voce acertou muitas\nquestoes!"
        }else {
            gameOverUiState.sentence = "Voce acertou poucas\nquestoes.."
        }
    }
    
    func checkMessage(){
        if gameUiState.score >= 50 {
            gameOverUiState.message = "Parabens!"
        }else {
            gameOverUiState.message = "Que pena!"
        }
    }
    
    func updateGameOverUiState(){
        checkSentence()
        checkMessage()
        checkImage()
    }
}
