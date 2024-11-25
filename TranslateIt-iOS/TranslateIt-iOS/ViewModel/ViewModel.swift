//
//  ViewModel.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 25/11/24.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var gameUiState: GameUiState = GameUiState()
    private var questions: [Question] = []
    
    init(){
        startGame()
    }
    
    func startGame() {
        questions = gameQuestions.shuffled()
        gameUiState.word = questions[0].word
        gameUiState.options = questions[0].options
       
        
    }
    
    func updateGame(){
        if questions.isEmpty {
            gameUiState.isGameOver = true
            return
        }else {
            gameUiState.word = questions[0].word
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
        }
    }
    
    func resetGame(){
        gameUiState.isGameOver = false
        gameUiState.score = 0
        startGame()
    }
    
    
    
   
   
}
