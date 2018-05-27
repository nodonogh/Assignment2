//
//  UQTriviaViewController.swift
//  Assignment2
//
//  Created by user138925 on 5/25/18.
//  Copyright © 2018 user138925. All rights reserved.
//

import UIKit

class UQTriviaViewController: UIViewController {
    
    //Set IBOUtlets
    @IBOutlet weak var trvQuestion: UITextView!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var trvProgress: UILabel!
    
    //Set the structure of the questions
    struct Question {
        let question : String
        let answers : [String]
        let correctAnswer : Int
    }
    
    //Populate the question array
    var questions : [Question] = [
        Question(
            question: "What is Touta Konoe's species?",
            answers: ["Human", "Human/Vampire", "Demon", "Monster"],
            correctAnswer: 1),
        Question(
            question: "What is Yukihime's actual name?",
            answers: ["Vamps", "Athanasia E.K. McDowell", "Kitty A.E. McDowell", "Evangeline A.K. McDowell"],
            correctAnswer: 3),
        Question(
            question: "What is the name of the power mainfesting inside Touta?",
            answers: ["Magia Erebea", "Dark Magic", "Necromancy", "Darkness"],
            correctAnswer: 0),
        Question(
            question: "Who built the orbital elevator seen in UQ Holder??",
            answers: ["Takahata T. Takamichi", "Megalo-Mesembrian Government", "Negi Springfield", "Nagi Springfield"],
            correctAnswer: 2),
        Question(
            question: "Fate Averruncus is a sworn friend of...",
            answers: ["Negi Springfield", "The Thousand Master", "The Lifemaker", "Evangeline"],
            correctAnswer: 0),
        Question(
            question: "How old is Ikku Ameya's real body?",
            answers: ["18", "25", "26", "13"],
            correctAnswer: 3),
        Question(
            question: "Who was tasked to assassinate Yukihime before joining her?",
            answers: ["Touta", "Kuromaru", "Kirie", "Gengoro Makabe"],
            correctAnswer: 1),
        Question(
            question: "Touta's sword was crafted by...",
            answers: ["Himself", "Dark Magic", "Albiero Imma", "Yukihime"],
            correctAnswer: 2),
        Question(
            question: "Who took Touta in after he was orphaned?",
            answers: ["Yukihime", "Ayaka Yukihiro", "Fate Averruncus", "Zazie Rainyday"],
            correctAnswer: 0),
        Question(
            question: "What character was omitted from the Anime but is in the Manga?",
            answers: ["Dana-san", "Santa Sasaki", "Setsuna Sakurazaki", "Asuna Kagurazaka"],
            correctAnswer: 1)
    ]
    
    //Determine what question the player is up to
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
    
    //Check the answer when button is pressed
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
    
    //load the next question
    func loadNextQuestion() {
        if(currentQuestionPosition + 1 < questions.count){
            currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestion()
        }else{
            performSegue(withIdentifier: "segueUQTriviaResults", sender: nil)
        }
    }
    
    //Set the display to show relevant questions and answers
    func setQuestion(){
        trvQuestion.text = currentQuestion!.question
        answer1.setTitle(currentQuestion!.answers[0], for: .normal)
        answer2.setTitle(currentQuestion!.answers[1], for: .normal)
        answer3.setTitle(currentQuestion!.answers[2], for: .normal)
        answer4.setTitle(currentQuestion!.answers[3], for: .normal)
        trvProgress.text = "\(currentQuestionPosition + 1)/\(questions.count)"
    }
    
    //segue to the results
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "segueUQTriviaResults"){
            let vc = segue.destination as! UQTriviaResultsViewController
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
