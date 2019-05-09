//
//  main.swift
//  Tennis
//
//  Created by 2019_DEV_157 on 08/05/2019.
//  Copyright © 2019 2019_DEV_157. All rights reserved.
//

import Foundation

var playerOne: Player
var playerTwo: Player
var game: Game
var tennisInput: TennisInput

tennisInput = TennisInput()

playerOne = Player(playerName: tennisInput.printMessageWithAnswer(message: "What is the name of the first player"))
playerTwo = Player(playerName: tennisInput.printMessageWithAnswer(message: "What is the name of the second player"))
game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)

while !Score().hasWinner(game: game){
    var playerWhoScore = tennisInput.selectPlayerWhoScore(firstPlayer: playerOne, secondPlayer: playerTwo)
    game.playerWinPoint(player: playerWhoScore)
    print(game.getScore())
}

exit(0)
