//
//  ViewModel+TestHelpers.swift
//  TranslateIt-iOSTests
//
//  Created by Allan Viana on 04/07/25.
//

import Foundation
@testable import TranslateIt_iOS  

extension ViewModel {
    convenience init(mockQuestions: [QuestionState]) {
        self.init()
        self.questions = mockQuestions
        updateGame()
    }
}
