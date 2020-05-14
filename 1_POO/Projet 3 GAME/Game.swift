//
//  Game.swift
//  Projet 3 GAME
//
//  Created by DL PARISATO on 22/01/2020.
//  Copyright © 2020 PARISATO. All rights reserved.
//

import Foundation

class Game {
    
    
    // MARK: - PROPERTIES
    
    
    // Variables that initialize the player
    var player1: Player
    var player2: Player
    
    // We contain the number of turns in the game to display the statistics at the end
    var numberRound = 0
    var arrayDead = [Character]()
    
    
    // MARK: - INITIALIZER
    
    
    init() {
        player1 = Player(playerNumber: 1)
        player1.createTeam()
        
        player2 = Player(playerNumber: 2)
        player2.createTeam()
        
    }
    
    
    // MARK: - METHODS
    
    
    // Function start displays combat and game statistics
    func start() {
        fight()         // Add the function fight (line 159)
        statisticGame()     // Add the function game (line 68)
    }
    
    
    // Function teamIsAlive checks if all the characters in a team are dead
    private func teamIsAlive(player: Player) -> Bool {
        /// The loop for in checks if the character has 0 life points. And if so delete the table
        for(index, character) in player.team.enumerated() {
            if character.lifePoint <= 0 {
                arrayDead.append(character)
                player.team.remove(at: index)
            }
        }
        // Return false when the all team was dead
        if player.team.count == 0 {
            return false
        }
        // Return true when there is at least one character
        return true
    }
    
    
    // Function statisticGame displays the winner and the game statistics.
    private func statisticGame() {
        print("""
            
        |✝️|✝️|✝️|✝️|✝️|✝️|✝️|✝️| Désolé toute l'équipe est morte |✝️|✝️|✝️|✝️|✝️|✝️|✝️|✝️|
            
        """)
        
        if teamIsAlive(player: player1) {
            print("""
            ⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟

            🏆🎖🏆🎖🏆 BRAVOOO !!! Le Player 1️⃣ a gagné! 🏆🎖🏆🎖🏆

            ⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟

            """)
            
        } else {
            print("""
            ⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟

            🏆🎖🏆🎖🏆 BRAVOOO !!! Le Player 2️⃣ a gagné! 🏆🎖🏆🎖🏆
            
            ⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟⭐️🌟

            """)

        }
        print("""
        ============================================================

        Le nombre de tours: \(numberRound)
            
        ============================================================

        """)
        
        print("""
            
        💀 Les Heros morts sont 💀
            
        """)
        
        for characterDead in arrayDead {
            print(" ✝️ le personnage \(characterDead.nameHero) qui est \(type(of: characterDead)) \(characterDead.lifePoint) 💔 ")
        }
    }
    
    
    // Function playerRound manages the player's turn
    private func playerRound(attacker: Player, defender: Player) {
        let chest = Chest()
        
        // Choose a character in the team
        let attackingCharacter = attacker.selectCharacter(team: attacker.team)
        
        // Check the type to assign an appropriate chest to the warrior or healer.
        /// If he is a healer. We assign a suitable weapon to Wizard
        if let wizard = attackingCharacter as? Wizard {
            if let newWeapon = chest.randomWeapon(type: .magic) {
                print("""
                    
                🎁 🎁 🎁 🧪 COFFRE MAGIQUE: Vous avez trouvé une meileure arme de guérrison 🧪 🎁 🎁 🎁
                    
                """)
                
                wizard.weapon = newWeapon
            }
            
            /// If it is a warrior character. We assign  an appropriate weapon.
            let targetCharacter = attacker.selectCharacter(team: attacker.team)
            wizard.heal(target: targetCharacter)
        } else {
            if let newWeapon = chest.randomWeapon(type: .attack) {
                print("""
                    
                🎁 🎁 🎁 ⚔️ COFFRE MAGIQUE: Vous avez touvé une meilleure arme d'attaque ⚔️ 🎁 🎁 🎁
                    
                """)
                
                attackingCharacter.weapon = newWeapon
            }
            
            // If it isn't a Wizard, we attack.
            let targetCharacter = attacker.selectCharacter(team: defender.team)
            attackingCharacter.attack(target: targetCharacter)
        }
    }
    
    
    // Function attack
    private func fight() {
        // This loop allows the player to choose his attack and his opponent.
        while teamIsAlive(player: player1) && teamIsAlive(player: player2) {
            print("""
                
            ♠️♥️♣️♦️♠️♥️♣️♦️ JOUEUR 1️⃣ c'est à toi! Tu choisis ton combattant, puis un ennemi ♠️♥️♣️♦️♠️♥️♣️♦️
                
            """)
            
            playerRound(attacker: player1, defender: player2)
            numberRound += 1
            
            if teamIsAlive(player: player2) {
                print("""
                    
                🔸🔹🔶🔷🔸🔹🔶🔷 JOUEUR 2️⃣ c'est à toi! Tu choisis ton combattant, puis un ennemi 🔸🔹🔶🔷🔸🔹🔶🔷
                    
                """)
                
                playerRound(attacker: player2, defender: player1)
                
            }
        }
    }

}
 


