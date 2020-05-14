//
//  Warrior.swift
//  Projet 3 GAME
//
//  Created by DL PARISATO on 22/01/2020.
//  Copyright © 2020 PARISATO. All rights reserved.
//

import Foundation


class Warrior: Character {
    
    
    // MARK: - PROPERTIES
    
    
    // Variable maxilifePoint allows code to subtract damage from WARRIOR lifePoint.
    static var maxiLifePoint = 100
    
    // Variable defautWeapon initializes WARRIOR with default weapon values.
    static private let defaultWeapon = Weapon(nameWeapon: "Sword", damageWeapon: 15, heal: 0)

    
    // MARK: - INITIALIZER
    
    
    // Initializer the class WARRIOR thanks to the character initializes
    /// - Parameter nameHero: nameHero calls the value stored in the array.
    init(nameHero: String) {
        super.init(nameHero: nameHero, lifePoint: Warrior.maxiLifePoint, weapon: Warrior.defaultWeapon)
    }
    
    
    // MARK: - METHODS
    
    
    // Function features allows adding character statistics.
    /// This function is used to help the player choose a character. We present him all the statistics of WARRIOR.
    static func features() -> String {
        
        /// Display text: "WARRIOR a (100) points de vie et son arme (SWORD) et a (15) points de dégâts"
        return "Warrior a \(Warrior.maxiLifePoint) pts de vie 💙 et a son arme \(Warrior.defaultWeapon.nameWeapon) 🗡🗡 et a \(Warrior.defaultWeapon.damageWeapon) pts de dégâts 💥💥💥"
    }
}
