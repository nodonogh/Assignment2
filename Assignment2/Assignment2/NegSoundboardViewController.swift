//
//  NegSoundboardViewController.swift
//  Assignment2
//
//  Created by NICK O'DONOGHUE on 22/5/18.
//  Copyright © 2018 user138925. All rights reserved.
//

import UIKit
import AVFoundation

class NegSoundboardViewController: UIViewController {
    
    //load in appropriate contents and set audio players
    var player = AVAudioPlayer()
    var player2 = AVAudioPlayer()
    let negOpening = Bundle.main.path(forResource: "neg_op", ofType: "mp3", inDirectory: "songs")
    let negEnding = Bundle.main.path(forResource: "neg_2op", ofType: "mp3", inDirectory: "songs")
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: negOpening!))
        } catch {
            print("Could not load file")
        }
        
        do {
            try player2 = AVAudioPlayer(contentsOf: URL(fileURLWithPath: negEnding!))
        } catch {
            print("Could not load file")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func PlayOP1(_ sender: Any) {
        //If the button is pressed and isPlaying equals false...
        if isPlaying == false {
            //Play the AV player
            player.play()
            isPlaying = true
        }else{
            //Pause the AV Player
            player.pause()
            isPlaying = false
        }
    }
    
    @IBAction func PlayOP2(_ sender: UIButton) {
        if isPlaying == false {
            player2.play()
            isPlaying = true
        }else{
            player2.pause()
            isPlaying = false
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
