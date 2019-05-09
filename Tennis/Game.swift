//
//  Game.swift
//  Tennis
//
//  Created by 2019_DEV_157 on 08/05/2019.
//  Copyright © 2019 2019_DEV_157. All rights reserved.
//

import Foundation

public class Game {
    private (set) var playerOne: Player
    private (set) var playerTwo: Player
    
    init(firstPlayer: Player, secondPlayer: Player){
        self.playerOne = firstPlayer
        self.playerTwo = secondPlayer
    }
    
    func playerWinPoint(player: Player){
        player.points += 1
    }
    
    func getPlayerWithHighestScore() -> Player?{
        if (playerOne.points != playerTwo.points){
            if (playerOne.points > playerTwo.points){
                return playerOne
            }else{
                return playerTwo
            }
        }else{
            return nil
        }
    }
    
    func hasWinner() -> Bool {
        if (playerTwo.points >= 4 && playerTwo.points >= playerOne.points + 2){
            return true
        }else if (playerOne.points >= 4 && playerOne.points >= playerTwo.points + 2){
            return true
        }else{
            return false
        }
    }
    
    func isDeuce() -> Bool {
        return (playerOne.points == playerTwo.points && playerOne.points >= 3)
    }
    
    func hasAdvantage() -> Bool {
        if (playerTwo.points >= 4 && playerTwo.points == playerOne.points + 1){
            return true
        }
        if (playerOne.points >= 4 && playerOne.points == playerTwo.points + 1){
            return true
        }else{
            return false
        }
    }
}
