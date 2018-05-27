//
//  UQMemoryViewController.swift
//  Assignment2
//
//  Created by user138925 on 5/19/18.
//  Copyright © 2018 user138925. All rights reserved.
//

import UIKit

class UQMemoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var imgs : [UIImage] = [
        UIImage(named: "uqMemorydef.jpg")!,
        UIImage(named: "uqMem1.jpg")!,
        UIImage(named: "uqMem2.jpg")!,
        UIImage(named: "uqMem3.jpg")!,
        UIImage(named: "uqMem4.jpg")!
    ]
    
    func rotate(_ sender : UIButton ) {
        UIView.animate(withDuration: 0.75, animations: {
            //sender.layer.transform = CATransform3DMakeRotation(22.0/7, 0, 1, 0)
        })
    }
    
    var lastButton : UIButton?
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        if sender.tag == 0 { return }
        
        sender.setImage(imgs[sender.tag], for: .normal)
        rotate(sender)
        
        //first touch
        if lastButton == nil {
            lastButton = sender
        }
            
            //match found
        else if lastButton != nil && sender.tag == lastButton!.tag {
            sender.tag = -1
            lastButton!.tag = -1
            lastButton = nil
        }
        else {
            sender.setImage(imgs[0], for: .normal)
            lastButton!.setImage(imgs[0], for: .normal)
            rotate(sender)
            rotate(lastButton!)
            lastButton = nil
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
