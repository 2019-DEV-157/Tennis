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
}
