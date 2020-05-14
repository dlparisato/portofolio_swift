//
//  Character.swift
//  Projet 3 GAME
//
//  Created by DL PARISATO on 22/01/2020.
//  Copyright © 2020 PARISATO. All rights reserved.
//

import Foundation

class Character {
    
    
    // MARK: -  PROPERTIES
    
    // We need the character who has a name, lide point and weapon.
    var nameHero : String
    var lifePoint : Int
    var weapon : Weapon
    
    
    //MARK:- INITIALIZER
    
    // Initialization of the above variables.
    init(nameHero: String, lifePoint: Int, weapon: Weapon) {
        self.nameHero = nameHero
        self.lifePoint = lifePoint
        self.weapon = weapon
    }
    
    // MARK: - METHODS
    
    
    // Function attack allows a character to inflict his damage points on the opponent.
    /// - parameter target : return to the target character for the attack.
    func attack(target: Character) {
        target.lifePoint -= self.weapon.damageWeapon
        
        /// Display text:
        print("\(self.nameHero) attaque  \(target.nameHero) et lui infligé \(self.weapon.damageWeapon) pts de vie 💥💥. \(target.nameHero) a maintenant \(target.lifePoint) pts de vie 💔 ")
        
        /// loop to check if the character is alive.
        if target.lifePoint <= 0 {
            target.lifePoint = 0
            print("""
                
            😞😭😞😭 \(target.nameHero) n'a plus de vie 😞😭😞😭
                
            """)
            
           
        }
    }
}



