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

class Score {
    
    func hasWinner(game: Game) -> Bool {
      return firstPlayerWins(game: game) || secondPlayerWins(game: game)
    }
    
    private func firstPlayerWins(game: Game) -> Bool {
        return game.firstPlayer.points >= Constants.POINTS_TO_WIN && game.firstPlayer.points >= game.secondPlayer.points + Constants.POINT_DIFFERENCE_TO_WIN
    }
    
    private func secondPlayerWins(game: Game) -> Bool {
        return game.secondPlayer.points >= Constants.POINTS_TO_WIN && game.secondPlayer.points >= game.firstPlayer.points + Constants.POINT_DIFFERENCE_TO_WIN
    }
    
    func isDeuce(game: Game) -> Bool {
        return (game.firstPlayer.points == game.secondPlayer.points && game.firstPlayer.points >= Constants.POINTS_FOR_DEUCE_ABLE)
    }
    
    func hasAdvantage(game: Game) -> Bool {
        return firstPlayerHasAdvantage(game: game) || secondPlayerHasAdvantqge(game: game)
    }
    
    private func firstPlayerHasAdvantage(game: Game) -> Bool {
        return game.firstPlayer.points >= Constants.POINTS_TO_WIN && game.firstPlayer.points == game.secondPlayer.points + Constants.POINT_DIFFERENCE_FOR_ADVANTAGE
    }
    
    private func secondPlayerHasAdvantqge(game: Game) -> Bool {
        return game.secondPlayer.points >= Constants.POINTS_TO_WIN && game.secondPlayer.points == game.firstPlayer.points + Constants.POINT_DIFFERENCE_FOR_ADVANTAGE
    }
    
    func getPlayerWithHighestScore(game: Game) -> Player{
        if (game.firstPlayer.points > game.secondPlayer.points){
            return game.firstPlayer
        }else{
            return game.secondPlayer
        }
    }
    
    func getScore(game: Game) -> String {
        if (hasWinner(game: game)){
            return getPlayerWithHighestScore(game: game).name + " wins"
        }
        
        if (hasAdvantage(game: game)){
            return "Advantage " + getPlayerWithHighestScore(game: game).name;
        }
        
        if (isDeuce(game: game)){
            return "Deuce"
        }
        
        if let pointsPlayerOne = Points(rawValue: game.firstPlayer.points), let pointsPlayerTwo = Points(rawValue: game.secondPlayer.points) {
            return "\(pointsPlayerOne.description()) - \(pointsPlayerTwo.description())"
        }
        
        return ""
    }
}
