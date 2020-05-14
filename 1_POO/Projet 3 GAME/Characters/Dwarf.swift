//
//  Dwarf.swift
//  Projet 3 GAME
//
//  Created by DL PARISATO on 22/01/2020.
//  Copyright © 2020 PARISATO. All rights reserved.
//

import Foundation

class Dwarf: Character {
    
    
    // MARK: - PROPRIETES
    
    
    // Variable maxilifePoint allows code to subtract damage from DWARF lifePoint.
    static var maxiLifePoint = 80
    
    // Variable defautWeapon initializes DWARF with default weapon values.
    static private let defaultWeapon = Weapon(nameWeapon: "Hatchet", damageWeapon: 20, heal: 0)
    
    
    // MARK: - INITIALIZER
    
    
    // Initializer the class DWARF thanks to the character initializes
    /// - Parameter nameHero: nameHero calls the value stored in the array.
    init(nameHero: String) {
        super.init(nameHero: nameHero, lifePoint: Dwarf.maxiLifePoint, weapon: Dwarf.defaultWeapon)
    }
    
    
    // MARK: - METHODES
    
    
    // Function features allows adding character statistics.
    /// This function is used to help the player choose a character. We present him all the statistics of DWARF.
    static func features() -> String {
        // Display text: "DWARF a (80) points de vie et son arme (HATCHET) et a (20) points de dégâts"
        return "Dwarf a \(Dwarf.maxiLifePoint) pts de vie 💙, a son arme \(Dwarf.defaultWeapon.nameWeapon) 🪓🪓 et a \(Dwarf.defaultWeapon.damageWeapon) pts de dégâts 💥💥💥"
    }
}

