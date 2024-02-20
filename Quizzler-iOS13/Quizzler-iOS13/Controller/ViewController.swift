//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreButton: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var question1Button: UIButton!
    @IBOutlet weak var question2Button: UIButton!
    @IBOutlet weak var question3Button: UIButton!
    
    var quizBrain = QuizBrain()
    var timer = Timer ()
    @objc func updateUI () {
        questionLabel.text = quizBrain.getQuestionText()
        question1Button.setTitle(quizBrain.getOption1 (), for: .normal)
        question2Button.setTitle(quizBrain.getOption2 (), for: .normal)
        question3Button.setTitle(quizBrain.getOption3 (), for: .normal)
        scoreButton.text = "Score: \(quizBrain.getScore())"
        question1Button.backgroundColor = UIColor.clear
        question2Button.backgroundColor = UIColor.clear
        question3Button.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        questionLabel.text = "Question text"
        question1Button.setTitle("Question 1", for: .normal)
        question2Button.setTitle("Question 2", for: .normal)
        question3Button.setTitle("Question 3", for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            updateUI ()
        }
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
        quizBrain.nextQuestion()
        
        }
    } 
