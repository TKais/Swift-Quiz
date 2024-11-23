//
//  ScoreViewModel.swift
//  Quiz
//
//  Created by Tiff Kaiser on 11/23/24.
//

import Foundation
import SwiftUI

class ScoreViewModel: ObservableObject {
    @Published var score: Score = Score(value: 0)
    
    var currentScore:String {
        return String(score.value)
    }
    
    func incrementScore() {
        score.value += 1
    }
    
    func resetScore() {
        score.value = 0
    }
}
