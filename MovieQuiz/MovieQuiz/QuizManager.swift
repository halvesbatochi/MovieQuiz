//
//  QuizManager.swift
//  MovieQuiz
//
//  Created by Henrique Alves Batochi on 12/02/22.
//

import Foundation

typealias Round = (quiz: Quiz, options: [QuizOption])

class QuizManager {
    
    let quizes: [Quiz]
    let quizOptions: [QuizOption]
    var round: Round?
    var score: Int
    
    init() {
        score = 0
        // Recuperando a URL do arquivo no projeto
        let quizesURL = Bundle.main.url(forResource: "quizes", withExtension: "json")!
        do {
            // Criação do DATA a partir da URL
            let quizesData = try Data(contentsOf: quizesURL)
            // Decodificando o DATA em um array de Quiz
            quizes = try JSONDecoder().decode([Quiz].self, from: quizesData)
            // Recuperando a URL do arquivo no projeto
            let quizOptionsURL = Bundle.main.url(forResource: "options", withExtension: "json")!
            // Criação da DATA a partir da URL
            let quizOptionsData = try! Data(contentsOf: quizOptionsURL)
            // Decoficando o Data em um array de QuizOptions
            quizOptions = try! JSONDecoder().decode([QuizOption].self, from: quizOptionsData)
        } catch {
            // Caso ocorra algum erro
            print(error.localizedDescription)
            quizes = []
            quizOptions = []
        }
    }
    
    func generateRandomQuiz() ->  Round {
        let quizIndex = Int(arc4random_uniform(UInt32(quizes.count)))
        let quiz = quizes[quizIndex]
        // Set<Int> é uma coleção não ordenada de um tipo em que não se pode repetir um valor já existente.
        var indexes: Set<Int> = [quizIndex]
        while indexes.count < 4 {
            let index = Int(arc4random_uniform(UInt32(quizes.count)))
            indexes.insert(index)
        }
        // $0 é o elemento que o .map esta interagindo
        let options = indexes.map({quizOptions[$0]})
        round = (quiz, options)
        
        return round!
    }
    
    func checkAnswer(_ answer: String) {
        guard let round = round else { return }
        if answer == round.quiz.name {
            score += 1
        }
    }
    
}

struct Quiz: Codable {
    let name: String
    let number: Int
}

struct QuizOption: Codable {
    let name: String
}
