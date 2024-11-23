//
//  ScoreViewModel.swift
//  Quiz
//
//  Created by Tiff Kaiser on 11/23/24.
//

import Foundation
import SwiftUI

class ScoreViewModel: ObservableObject {
    @Published var score: Score = Score(score: 0)
    
    var currentScore:String {
        return String(score.score)
    }
    
    func incrementScore() {
        score.score += 1
    }
    
    func resetScore() {
        score.score = 0
    }
}
