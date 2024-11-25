//
//  ContentView.swift
//  Quiz
//
//  Created by Tiff Kaiser on 11/23/24.
//

import SwiftUI
import ConfettiSwiftUI

struct ContentView: View {
    @StateObject private var questionViewModel = QuestionViewModel()
    
    @StateObject private var scoreViewModel = ScoreViewModel()
    
    @State private var userInput:String = ""
    
    @State private var confettiCounter = 0
    
    @State private var isValid = true
    
    @State private var validationResult = ""
    
    let validator = ValidationUtils()
    
    var body: some View {
        VStack {
            ScoreView(scoreViewModel: scoreViewModel)
            
            Label("Question", systemImage: "questionmark.circle")
                .padding()
                .bold()
            Text(questionViewModel.currentQuestion.text)
            
            TextField(
                    "Enter answer",
                    text: $userInput
                )
            .border((isValid ? Color.black : Color.red), width: (isValid ? 0.5 : 2))
                .padding()
                .onSubmit {
                    validationResult = validator.validateTextField(userInput, answer: questionViewModel.currentQuestion.answer)
                    
                    if validationResult == "" {
                        isValid = true
                        scoreViewModel.incrementScore()
                        
                        confettiCounter += 1
                        userInput = ""
                        questionViewModel.showNextQuestion()
                    } else {
                        isValid = false
                    }
                }
            ConfettiCannon(counter: $confettiCounter, num: 30, colors: [.red, .blue, .green], confettiSize: 15)
            
            HStack {
                Button("Show Answer") {
                    if questionViewModel.showAnswer == false {
                        questionViewModel.toggleAnswer()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            questionViewModel.showNextQuestion()
                            userInput = ""
                        }
                    }
                }
                
                if questionViewModel.showAnswer {
                    Text(questionViewModel.currentQuestion.answer)
                }
            }
            
            
            Button("Skip") {
                questionViewModel.showNextQuestion()
                userInput = ""
            }
            
            Spacer()
            
            if !isValid {
                Text(validationResult)
                    .font(.subheadline)
                    .foregroundStyle(.red)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
