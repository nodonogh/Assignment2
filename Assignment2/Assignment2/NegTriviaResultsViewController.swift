//
//  NegTriviaResultsViewController.swift
//  Assignment2
//
//  Created by user138925 on 5/24/18.
//  Copyright © 2018 user138925. All rights reserved.
//

import UIKit

class NegTriviaResultsViewController: UIViewController {

    @IBOutlet weak var negComment: UILabel!
    @IBOutlet weak var negTriviaResult: UILabel!
    
    var noCorrect = 0
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        negTriviaResult.text = "You got \(noCorrect) out of \(total) correct"
        
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
        negComment.text = title
        
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
