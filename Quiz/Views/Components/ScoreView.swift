//
//  ScoreView.swift
//  Quiz
//
//  Created by Tiff Kaiser on 11/23/24.
//

import SwiftUI

struct ScoreView:View {
    let scoreViewModel:ScoreViewModel
    
    var body: some View {
        HStack {
            Label("Score:", systemImage: "score.circle")
                .padding()
                .bold()
            Text(scoreViewModel.currentScore)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding()
        .padding(.bottom)
    }
}
