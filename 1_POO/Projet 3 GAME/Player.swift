//
//  Player.swift
//  Projet 3 GAME
//
//  Created by DL PARISATO on 22/01/2020.
//  Copyright © 2020 PARISATO. All rights reserved.
//

import Foundation

class Player {
    
    
    // MARK: - PROPERTIES
    
    
    // Variable playerNumber will contain the player number.
    var playerNumber: Int
    
    // Variable team stores in a table the characters chosen by a player for create team.
    var team = [Character]()
    
    // Variable namesTable stores in a table. The names of the characters chosen by the player.
    static private var namesTable = [String]()
    
    
    // MARK: - INITIALIZER

    
    // Initialize the variable playerNumber.
    init(playerNumber: Int) {
        self.playerNumber = playerNumber
    }
    
    
    // MARK: - METHODS

    
    // Function nameCharacter put the name that the player has chosen for his character.
    /// We check that the name is written without spaces with more than 3 characters. And we make sure that the name doesn't already.
    private func nameCharacter() -> String {
        if let namePlayer = readLine() {
            
            /// If the name contains spaces and or less than 3 characters, an error message is returned.
            let choice = namePlayer.trimmingCharacters(in: .whitespaces)
            if choice.count < 3 || Player.namesTable.contains(choice) {
                print("Choisissez un nom de plus de 3 caractères et qui n'existe pas encore")
            } else {
                Player.namesTable.append(choice)
                
                return choice
            }
        }
        return nameCharacter()
    }
    
    
    // Function createTeam initializes the team.
    func createTeam() {
        /// If the player doesn't these 3 characters, the game can't start.
        while team.count < 3 {
            /// We display the list of available characters and their characteristics.
            print("""
                
                           👤 Joueur \(playerNumber) choisissez 3 personnages dans la liste ci-dessous :
                           =============================================================================
                
                1. \(Warrior.features())
                
                2. \(Wizard.features())
                
                3. \(Dwarf.features())
                
                """)
            
            /// We ask the choice of the player between 1 and 3.
            if let choice = readLine() {
                switch choice {
                case "1" :
                    print("""
                        
                    Tu as choisi le WARRIOR 🦸🏻‍♀️ donne-lui un nom :
                        
                    """)
                    
                    /// Ask for the name of the character
                    let nameHero = nameCharacter()
                    let character = Warrior(nameHero: nameHero)
                    
                    /// Add the character to create to the team.
                    team.append(character)
                    
                    
                case "2" :
                    print("""
                        
                    Tu as choisi le WIZARD 🧙‍♂️ donne-lui un nom :
                        
                    """)
                    
                    let nameHero = nameCharacter()
                    let character = Wizard(nameHero: nameHero)
                    
                    team.append(character)
                    
                
                case "3" :
                    print("""
                        
                    Tu as choisi le DWARF 🧑‍🚒 donne-lui un nom :
                        
                    """)
                    
                    let nameHero = nameCharacter()
                    let character = Dwarf(nameHero: nameHero)
            
                    team.append(character)
                    
                    
                default:
                    print("Saisi un chiffre entre 1 et 3")
                }
            }
        }
        print(Player.namesTable.count)
        print(Player.namesTable)
    }
    
    
    // Function selectCharacter allows to choose a character in a team.
    ///- Parameter : we display the list of team characters contained in the table.
    func selectCharacter(team: [Character]) -> Character {
        for (index, character) in team.enumerated() {
            
            if let wizard = character as? Wizard{
                print(" -> le personnage \(index + 1) s'appelle \(wizard.nameHero), est un \(type(of: wizard)) , sa vie \(wizard.lifePoint) , ses dégâts \(wizard.weapon.damageWeapon) et son soins \(wizard.weapon.heal)")
            } else {
                /// We display the full list of teams.
                print(" -> le personnage \(index + 1) s'appelle \(character.nameHero), est un \(type(of: character)) , sa vie \(character.lifePoint) et ses dégâts \(character.weapon.damageWeapon) ")
            }
        }
        
    // This loop allows to listen to the player's choice of character.
    /// Check that the number is between 1 and team.count you cann't choose a dead character.
        if let choice = readLine() {
            if let choiceInt = Int(choice) {
                if choiceInt >= 1 && choiceInt <= team.count {
                    return team[choiceInt - 1]
                }
            }
        }
        // Return function selecCharacter.
        return selectCharacter(team: team)
    }
}



