//
//  Wizard.swift
//  Projet 3 GAME
//
//  Created by DL PARISATO on 22/01/2020.
//  Copyright © 2020 PARISATO. All rights reserved.
//

import Foundation

class Wizard: Character {
    
    
    // MARK: - PROPERTIES
    
    // Variable maxilifePoint allows code to subtract damage from WIZARD lifePoint.
    static var maxLifePoint = 90
    
    // Variable defaultWeapon initialise l'arme de WIZARD avec les valeurs d'arme par défaut
    static private let defaultWeapon = Weapon(nameWeapon: "Electrical Attack", damageWeapon: 5, heal: 10)
    
    
    // MARK: - INITIALIZER
    
    
    // Initializer the class WIZARD thanks to the character initializes
    /// - Parameter nameHero: nameHero calls the value stored in the array.
    init(nameHero: String) {
        super.init(nameHero: nameHero, lifePoint: Wizard.maxLifePoint, weapon: Wizard.defaultWeapon)
    }
    
    
    // MARK: - METHODS
    
    
    // Function features allows adding character statistics.
    /// This function is used to help the player choose a character. We present him all the statistics of WIZARD.
    static func features() -> String {
        
        /// Display text: "WIZARD a (90) points de vie et son arme (Electrical Attack),  a (5) points de dégâts et a (10) points de soins"
        return "Wizard a \(Wizard.maxLifePoint) pts de vie 💙, a son arme \(Wizard.defaultWeapon.nameWeapon) ⚡️⚡️ , a \(Wizard.defaultWeapon.damageWeapon) pts de dégâts 💥💥💥  et a \(Wizard.defaultWeapon.heal) pts de soins 💚"
    }
    
    // Function heal restores the life point of the character chosen in the team.
    /// - Parameter target: Return to target character for healing.
    func heal(target: Character) {
        target.lifePoint = target.lifePoint + self.weapon.heal
    }
}

