import Foundation

struct Question {
    let question: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], ca: String) {
        question = q
        answer = a
        correctAnswer = ca
    }
}
