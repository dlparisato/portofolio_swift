//
//  Weapon.swift
//  Projet 3 GAME
//
//  Created by DL PARISATO on 12/02/2020.
//  Copyright © 2020 PARISATO. All rights reserved.
//

import Foundation

class Weapon {
    

    // MARK: - PROPERTIES
    
    // We need a name weapon and the damage number
    var nameWeapon: String
    var damageWeapon: Int
    
    // Use only the Wizard character
    var heal: Int
    
    
    // MARK: - INITIALIZER
    
    // Initialization of class variables:
    init(nameWeapon: String, damageWeapon: Int, heal: Int) {
        self.nameWeapon = nameWeapon
        self.damageWeapon = damageWeapon
        self.heal = heal
    }
    
    
    // MARK: - NO METHOD

}
