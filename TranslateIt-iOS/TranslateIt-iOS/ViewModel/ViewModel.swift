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
    private var questions: [Question] = []
    var returnToWelcome: Bool = false
    
    init(){
        startGame()
    }
    
    func startGame() {
        questions = gameQuestions.shuffled()
        gameUiState.word = questions[0].word
        gameUiState.options = questions[0].options
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
        if gameUiState.score >= 100 {
            gameOverUiState.image = "HappyEnd"
        }else {
            gameOverUiState.image = "BadEnd"
        }
    }
    func checkSentence(){
        if gameUiState.score >= 100 {
            gameOverUiState.sentence = "Voce acertou muitas questoes!"
        }else {
            gameOverUiState.sentence = "Voce acertou poucas questoes.."
        }
    }
    
    
    func checkMessage(){
        if gameUiState.score >= 100 {
            gameOverUiState.message = "Parabens!"
        }else {
            gameOverUiState.message = "Melhore.."
        }
    }
    
    
    func updateGameOverUiState(){
        checkSentence()
        checkMessage()
        checkImage()
    }
    
   
   
}
