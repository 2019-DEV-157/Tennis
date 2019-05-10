//
//  Game.swift
//  Tennis
//
//  Created by 2019_DEV_157 on 08/05/2019.
//  Copyright © 2019 2019_DEV_157. All rights reserved.
//

import Foundation

public class Game {
    private (set) var firstPlayer: Player
    private (set) var secondPlayer: Player
    var score: Score
    
    init(firstPlayer: Player, secondPlayer: Player){
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
        self.score = Score.shared
    }
    
    func playerWinPoint(player: Player){
        player.points += Constants.POINT_VALUE
    }
    
    func getScore() -> String{
        return score.getScore(game: self)
    }
}
