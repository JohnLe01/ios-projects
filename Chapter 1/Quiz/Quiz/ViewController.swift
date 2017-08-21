//
//  ViewController.swift
//  Quiz
//
//  Created by John Le on 5/8/17.
//  Copyright © 2017 John Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["What is 7+7?",
                               "What is the capital of Vermont?",
                               "From what is cognac made"]
    
    let answers: [String] = ["14",
                             "Montpelier",
                             "Grapes"]
    
    var currentQuestionIndex: Int = 0;
    
    @IBAction func showNextQuestion(sender: AnyObject) {
//        NSLog("Showing next question");
        
        currentQuestionIndex = currentQuestionIndex + 1;
        
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0;
        }
        
        let question: String = questions[currentQuestionIndex]
        
        questionLabel.text = question;
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
//        NSLog("Showing answer");
        
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
}

