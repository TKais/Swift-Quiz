//
//  ContentViewModel.swift
//  Quiz
//
//  Created by Tiff Kaiser on 11/23/24.
//
import Foundation
import SwiftUI

class QuestionViewModel: ObservableObject {
    @Published private(set) var questions: [Question] = [
        Question(text: "What is the capital of the United States?", answer: "Washington DC"),
        Question(text: "What is the largest country in the world?", answer: "China"),
        Question(text: "What is the most populous country in the world?", answer: "India"),
        Question(text: "What is the smallest country in the world?", answer: "Antarctica"),
        Question(text: "What is the longest river in the world?", answer: "Amazon"),
        Question(text: "What is the largest ocean in the world?", answer: "Pacific"),
        Question(text: "What is the smallest ocean in the world?", answer: "Atlantic"),
        Question(text: "What is the largest desert in the world?", answer: "Sahara"),
        Question(text: "What is the smallest desert in the world?", answer: "Atacama"),
    ]
    
    @Published var currentIndex: Int = 0
    
    // current question
    var currentQuestion: Question {
        questions[currentIndex]
    }
    
    func showNextQuestion() {
        currentIndex = (currentIndex + 1) % questions.count
    }
}
