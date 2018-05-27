//
//  NegTriviaViewController.swift
//  Assignment2
//
//  Created by user138925 on 5/24/18.
//  Copyright © 2018 user138925. All rights reserved.
//

import UIKit

class NegTriviaViewController: UIViewController {

    @IBOutlet weak var trvQuestion: UITextView!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var trvProgress: UILabel!
    
    struct Question {
        let question : String
        let answers : [String]
        let correctAnswer : Int
    }
    
    var questions : [Question] = [
        Question(
            question: "How old is Negi Springfield?",
            answers: ["8", "10", "11", "16"],
            correctAnswer: 1),
        Question(
            question: "What is the name Nagi Springfield is often known as?",
            answers: ["Ala Rubra", "Red-haired idiot", "Master of Spells", "The Thousand Master"],
            correctAnswer: 3),
        Question(
            question: "Who is Negi's Mother?",
            answers: ["Princess Arika", "Shizuna-Sensei", "Nekane Springfield", "Anya"],
            correctAnswer: 0),
        Question(
            question: "Who gave Negi his Magi Erebea scroll?",
            answers: ["Evangeline", "Jack Rakan", "Takahata T Takamichi", "Albeiro Imma"],
            correctAnswer: 1),
        Question(
            question: "What is Asuna's magical ability??",
            answers: ["Magia Erebea", "Dark Magic", "Magic Cancel", "Sword Magic"],
            correctAnswer: 2),
        Question(
            question: "How many students are in Negi's class at Mahora?",
            answers: ["27", "16", "42", "31"],
            correctAnswer: 3),
        Question(
            question: "What is the name of the team that Negi formed?",
            answers: ["Ala Alba", "Ala Rubra", "Ala Midori", "Ala Negius"],
            correctAnswer: 0),
        Question(
            question: "Who travelled back in time from Mars to warn Negi at MahoraFest?",
            answers: ["Evangeline", "Nagi", "Chao Lingshen", "Ku Fei"],
            correctAnswer: 2),
        Question(
            question: "What does Negi teach at Mahora??",
            answers: ["English", "History", "Magic", "Geography"],
            correctAnswer: 0),
        Question(
            question: "Where is Negi from?",
            answers: ["Japan", "Australia", "England", "Wales"],
            correctAnswer: 3)
    ]
    
    var currentQuestion: Question?
    var currentQuestionPosition = 0
    var noCorrect = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currentQuestion = questions[0]
        setQuestion()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func trvAnswer1(_ sender: Any) {
        checkAnswer(idx: 0)
    }
    
    @IBAction func trvAnswer2(_ sender: Any) {
        checkAnswer(idx: 1)
    }
    
    @IBAction func trvAnswer3(_ sender: Any) {
        checkAnswer(idx: 2)
    }
    
    @IBAction func trvAnswer4(_ sender: Any) {
        checkAnswer(idx: 3)
    }
    
    func checkAnswer(idx: Int) {
        if(idx == currentQuestion!.correctAnswer){
            noCorrect += 1
        }
        loadNextQuestion()
    }
    
    func loadNextQuestion() {
        if(currentQuestionPosition + 1 < questions.count){
            currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestion()
        }else{
            performSegue(withIdentifier: "segueNegTriviaResults", sender: nil)
        }
    }
    
    func setQuestion(){
        trvQuestion.text = currentQuestion!.question
        answer1.setTitle(currentQuestion!.answers[0], for: .normal)
        answer2.setTitle(currentQuestion!.answers[1], for: .normal)
        answer3.setTitle(currentQuestion!.answers[2], for: .normal)
        answer4.setTitle(currentQuestion!.answers[3], for: .normal)
        trvProgress.text = "\(currentQuestionPosition + 1)/\(questions.count)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "segueNegTriviaResults"){
            let vc = segue.destination as! NegTriviaResultsViewController
            vc.noCorrect = noCorrect
            vc.total = questions.count
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
