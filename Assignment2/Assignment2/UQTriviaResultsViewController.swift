//
//  UQTriviaResultsViewController.swift
//  Assignment2
//
//  Created by user138925 on 5/25/18.
//  Copyright © 2018 user138925. All rights reserved.
//

import UIKit

class UQTriviaResultsViewController: UIViewController {
    
    @IBOutlet weak var UQComment: UILabel!
    @IBOutlet weak var UQTriviaResult: UILabel!
    
    //Set variable to pass data into from trivia view controller
    var noCorrect = 0
    var total = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Determine how the user went
        UQTriviaResult.text = "You got \(noCorrect) out of \(total) correct"
        
        var percentRight = Double(noCorrect) / Double(total)
        percentRight *= 100
        
        var title = ""
        if(percentRight < 40) {
            title = "Ouch!"
        }else if(percentRight < 70){
            title = "Close!"
        }else {
            title = "Fantastic!"
        }
        UQComment.text = title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
