//
//  T-UQCharDetailsViewController.swift
//  Assignment2
//
//  Created by NICK O'DONOGHUE on 15/5/18.
//  Copyright © 2018 user138925. All rights reserved.
//

import UIKit

class T_UQCharDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var character : Character?
    
    @IBOutlet weak var charName: UILabel!
    @IBOutlet weak var charDetails: UILabel!
    @IBOutlet weak var charImg: UIImageView!
    
    override func viewWillAppear(_ animated: Bool){
        if character != nil {
            charName.text = character!.charName
            charDetails.text = character!.charDetails
            charImg.image = character!.img
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
