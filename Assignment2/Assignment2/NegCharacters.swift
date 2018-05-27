//
//  NegCharacters.swift
//  Assignment2
//
//  Created by user138925 on 5/15/18.
//  Copyright © 2018 user138925. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class NegCharacter : NSObject {
    var charName : String?
    var charDetails : String?
    var img : UIImage
    
    init(_ name : String,_ details : String,_ image : UIImage ){
        charName = name
        charDetails = details
        img = image
        
        super.init()
    }
    
}

class NegCharacters {
    static var characters = [NegCharacter]()
    
    static func getChars() -> [NegCharacter] {
        if characters.count == 0 { loadChars() }
        return characters
    }
    
    static func getChar(at : Int) -> NegCharacter? {
        if characters.count < 1 { loadChars() }
        
        if at >= 0 && at < characters.count {
            return characters[at]
        }
        return nil
    }
    
    static func loadChars() {
        if characters.count == 0 {
            
            characters.append ( NegCharacter("Negi Springfield", "Son of the Thousand Master, Negi, is determined to follow in his father's footsteps and save the world.", UIImage(named : "negi_pic.jpg")!))
            characters.append ( NegCharacter("Evangeline A.K. McDowell", "Known vampire to Mahora Academy staff, Eva is one of the most powerful beings on the planet, living for several centuries.", UIImage(named : "eva.jpg")!))
            characters.append ( NegCharacter("Asuna Kagurazaka", "Asuna was living a regular high school life until Negi showed up.", UIImage(named : "asuna.png")!))
            characters.append ( NegCharacter("Nodoka Miyazaki", "The shy one known as Bookstore/Bookworm", UIImage(named : "nodoka.jpg")!))
            characters.append ( NegCharacter("Nagi Springfield", "Legendary hero who saved the world with Ala Rubra, alongside the strongest of the strong.", UIImage(named : "nagi.png")!))
            characters.append( NegCharacter("Yue Ayase", "Best friend of Nodoka, she is a peculiar one.", UIImage(named : "yue.png")!))
            
        }
    }
}
