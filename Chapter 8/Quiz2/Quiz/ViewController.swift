//
//  ViewController.swift
//  Quiz
//
//  Created by John Le on 5/8/17.
//  Copyright © 2017 John Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["What is 7+7?",
                               "What is the capital of Vermont?",
                               "From what is cognac made"]
    
    let answers: [String] = ["14",
                             "Montpelier",
                             "Grapes"]
    
    var currentQuestionIndex: Int = 0;
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex = currentQuestionIndex + 1;
        
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0;
        }
        
        let question: String = questions[currentQuestionIndex]
        
        nextQuestionLabel.text = question;
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    func animateLabelTransitions() {
        // Force any outstanding layout changes to occur
        view.layoutIfNeeded()
        
        // Animate the alpha
        // and the center X constraints
        let screenWidth = view.frame.width
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth + (screenWidth/2.55)
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                        self.currentQuestionLabel.alpha = 0
                        self.nextQuestionLabel.alpha = 1
                        self.view.layoutIfNeeded()
                       },
                       completion: { _ in
                        self.currentQuestionLabel.text = self.nextQuestionLabel.text
                        self.currentQuestionLabel.alpha = 1
                        self.currentQuestionLabelCenterXConstraint.constant = 0
                        self.view.layoutIfNeeded()
                        self.nextQuestionLabel.alpha = 0
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set the label's initial alpha
         nextQuestionLabel.alpha = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
        
        nextQuestionLabelCenterXConstraint.isActive = false
        
        let spaceBetweenLabels = UILayoutGuide()
        self.view.addLayoutGuide(spaceBetweenLabels)
        spaceBetweenLabels.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        nextQuestionLabel.trailingAnchor.constraint(equalTo: spaceBetweenLabels.leadingAnchor).isActive = true
        currentQuestionLabel.leadingAnchor.constraint(equalTo: spaceBetweenLabels.trailingAnchor).isActive = true
    }
}

