//
//  Chest.swift
//  Projet 3 GAME
//
//  Created by DL PARISATO on 12/02/2020.
//  Copyright © 2020 PARISATO. All rights reserved.
//

import Foundation

class Chest {
    
    
    // MARK: - ENUMERATION
    
    enum AttackType {
        case magic, attack
    }
    
    // MARK: - PROPERTIES
    
    private let newWeapon = ""
    private let damage = 30
    private let magicWeapon = Weapon(nameWeapon: "Magic Weapon", damageWeapon: 0, heal: 10)
    private let specialWeapon = Weapon(nameWeapon: "Special Weapon", damageWeapon: 25, heal: 0)
    
    
    // MARK: - METHODS
    
    // Fonction randomWeapon (a special weapon) when you fall on the trunk
    func randomWeapon(type: AttackType) -> Weapon? {
        let randomInt = Int.random(in: 1...3)
        if randomInt == 2 {
            
            /// This condition deducts the type of the character in order to assign him a suitable chest.
            if type == .attack {
                return specialWeapon
            } else {
                return magicWeapon
            }
            /// return nil if the chance is not equal to 2
        }
        return nil
    }
}
