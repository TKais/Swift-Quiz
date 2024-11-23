//
//  ContentView.swift
//  Quiz
//
//  Created by Tiff Kaiser on 11/23/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = QuestionViewModel()
    
    @StateObject private var scoreViewModel = ScoreViewModel()
    
    @State private var userInput:String = ""
    
    var body: some View {
        VStack {
            Label("Score", systemImage: "score.circle")
                .padding()
                .bold()
            Text(scoreViewModel.currentScore)
            
            Label("Question", systemImage: "questionmark.circle")
                .padding()
                .bold()
            Text(viewModel.currentQuestion.text)
            
            TextField(
                    "Enter answer",
                    text: $userInput
                )
                .border(Color.black, width: 0.5)
                .padding()
                .onSubmit {
                    if viewModel.validateAnswer(input: userInput) {
                        scoreViewModel.incrementScore()
                        
                    }
                }
            
            Spacer()
            
            Button("Show Answer") {
                if viewModel.showAnswer == false {
                    viewModel.toggleAnswer()
                }
            }

            if viewModel.showAnswer {
                Text(viewModel.currentQuestion.answer)
            }
            
            Spacer()
            
            Button("Show Next Question") {
                viewModel.showNextQuestion()
                userInput = ""
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
