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

playerOne = Player(playerName: "John")
playerTwo = Player(playerName: "David")

game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)

print("test input")
tennisInput.

//Fifteen - Love
game.playerWinPoint(player: playerOne)
print(game.getScore())
//Fifteen - Fifteen
game.playerWinPoint(player: playerTwo)
print(game.getScore())
//Fifteen - Thirty
game.playerWinPoint(player: playerTwo)
print(game.getScore())
//Thirty - Thirty
game.playerWinPoint(player: playerOne)
print(game.getScore())
//Thirty - Forty
game.playerWinPoint(player: playerTwo)
print(game.getScore())
//Deuce
game.playerWinPoint(player: playerOne)
print(game.getScore())
//Advantage John
game.playerWinPoint(player: playerOne)
print(game.getScore())
//Deuce
game.playerWinPoint(player: playerTwo)
print(game.getScore())
//Advantage John
game.playerWinPoint(player: playerOne)
print(game.getScore())
//John wins
game.playerWinPoint(player: playerOne)
print(game.getScore())

