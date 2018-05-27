//
//  Characters.swift
//  Assignment2
//
//  Created by NICK O'DONOGHUE on 15/5/18.
//  Copyright © 2018 user138925. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Character : NSObject {
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
    
    class Characters {
        static var characters = [Character]()
        
        static func getChars() -> [Character] {
            if characters.count == 0 { loadChars() }
            return characters
        }
        
        static func getChar(at : Int) -> Character? {
            if characters.count < 1 { loadChars() }
            
            if at >= 0 && at < characters.count {
                return characters[at]
            }
            return nil
        }
        
        static func loadChars() {
            if characters.count == 0 {
                
                characters.append ( Character("Touta Konoe", "With his parents gone, Touta was taken in by Yukihime, who raised him into the boy he is now. With his powers being derived from Yukihime, he is perhaps on par with Karin in the UQ Holder team.", UIImage(named : "touta.png")!))
                characters.append ( Character("Yukihime", "Another vampire, the vampire who gave Touta his powers. Also known as Evangeline A.K. McDowell, Yukihime is the world's strongest vampire, walking with a several million dollar bounty on her head at all times.", UIImage(named : "yukihime.png")!))
                characters.append ( Character("Kuromaru Tokisaka", "Immortal hunter despite being immortal himself, found friendship through his assignment to assassinate the Dark Evangel.", UIImage(named : "kuromaru.png")!))
                characters.append ( Character("Karin Yuuki", "The Saintess of Steel. Her immortality is S class and is perhaps one of the strongest in the team.", UIImage(named : "karin.png")!))
                characters.append ( Character("Ikku Ameya", "A robot with the conciousness of a 13 year-old boy in a coma, he joined UQ Holder as an immortal due to his robotic body.", UIImage(named : "ikku.png")!))
                characters.append( Character("Kirie Sakurame", "Kirie's Reset and Restart type of immortality ensures her to be one of UQ Holder's most prized assets... As well as her financial backing!", UIImage(named : "kirie.png")!))
                
            }
        }
    }

