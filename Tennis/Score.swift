//
//  Score.swift
//  Tennis
//
//  Created by 2019_DEV_157 on 09/05/2019.
//  Copyright © 2019 2019_DEV_157. All rights reserved.
//

import Foundation

enum Points: Int {
    case Love, Fifteen, Thirty, Forty
    
    func description() -> String{
        switch self {
        case .Love:
            return "Love"
        case .Fifteen:
            return "Fifteen"
        case .Thirty:
                return "Thirty"
        case .Forty:
            return "Forty"
    }
}
}

public class Score {
    
    func getScore() -> String{
        return "score"
    }
    
    func hasWinner(game: Game) -> Bool {
        if (game.playerTwo.points >= 4 && game.playerTwo.points >= game.playerOne.points + 2){
            return true
        }else if (game.playerOne.points >= 4 && game.playerOne.points >= game.playerTwo.points + 2){
            return true
        }else{
            return false
        }
    }
    
    func isDeuce(game: Game) -> Bool {
        return (game.playerOne.points == game.playerTwo.points && game.playerOne.points >= 3)
    }
    
    func hasAdvantage(game: Game) -> Bool {
        if (game.playerTwo.points >= 4 && game.playerTwo.points == game.playerOne.points + 1){
            return true
        }
        if (game.playerOne.points >= 4 && game.playerOne.points == game.playerTwo.points + 1){
            return true
        }else{
            return false
        }
    }
    
    func getPlayerWithHighestScore(game: Game) -> Player?{
        if (game.playerOne.points != game.playerTwo.points){
            if (game.playerOne.points > game.playerTwo.points){
                return game.playerOne
            }else{
                return game.playerTwo
            }
        }else{
            return nil
        }
    }
    
    func getScore(game: Game) -> String {
        if (hasWinner(game: game)){
            if let winner = getPlayerWithHighestScore(game: game){
                return winner.name + " wins"
            }
        }
        
        if (hasAdvantage(game: game)){
            if let advantage = getPlayerWithHighestScore(game: game){
                return "Advantage " + advantage.name;
            }
        }
        
        if (isDeuce(game: game)){
            return "Deuce"
        }
        
        if let pointsPlayerOne = Points(rawValue: game.playerOne.points), let pointsPlayerTwo = Points(rawValue: game.playerTwo.points) {
            return "\(pointsPlayerOne.description()) - \(pointsPlayerTwo.description())"
        }
        
        return ""
    }
}
