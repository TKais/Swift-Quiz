//
//  ContentView.swift
//  Quiz
//
//  Created by Tiff Kaiser on 11/23/24.
//

import SwiftUI
import ConfettiSwiftUI

struct ContentView: View {
    @StateObject private var viewModel = QuestionViewModel()
    
    @StateObject private var scoreViewModel = ScoreViewModel()
    
    @State private var userInput:String = ""
    
    @State private var confettiCounter = 0
    
    var body: some View {
        VStack {
            ScoreView(scoreViewModel: scoreViewModel)
            
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
                        
                        confettiCounter += 1
                        userInput = ""
                        viewModel.showNextQuestion()
                    }
                }
            ConfettiCannon(counter: $confettiCounter, num: 30, colors: [.red, .blue, .green], confettiSize: 15)
            
            HStack {
                Button("Show Answer") {
                    if viewModel.showAnswer == false {
                        viewModel.toggleAnswer()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            viewModel.showNextQuestion()
                            userInput = ""
                        }
                    }
                }
                
                if viewModel.showAnswer {
                    Text(viewModel.currentQuestion.answer)
                }
            }
            
            
            Button("Skip") {
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
