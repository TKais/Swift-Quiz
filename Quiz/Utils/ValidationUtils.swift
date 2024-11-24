//
//  ValidationUtils.swift
//  Quiz
//
//  Created by Tiff Kaiser on 11/24/24.
//

import Foundation

struct ValidationUtils {
    let errorMessages: [String: String] = [
        "isEmpty": "Field cannot be empty",
        "isIncorrect": "Answer is incorrect",
        "hasInvalidCharacters": "Field can only contain alpha-numeric characters"
    ]
    
    func validateTextField(_ input: String, answer: String) -> String {
        if isEmpty(input) { return errorMessages["isEmpty"] ?? "Error" }
        if containsNonAlphanumericCharacters(input) { return errorMessages["hasInvalidCharacters"] ?? "Error" }
        if isIncorrectAnswer(input, answer: answer) { return errorMessages["isIncorrect"] ?? "Error" }
        
        return ""
    }
    
    func isEmpty(_ input: String) -> Bool {
        input.isEmpty
    }
    
    func isIncorrectAnswer(_ input: String, answer: String) -> Bool {
        input.lowercased() != answer.lowercased()
    }
    
    func containsNonAlphanumericCharacters(_ string: String) -> Bool {
        // Check if any character in the string is not alphanumeric
        return string.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil
    }
}
