//
//  ScoreTests.swift
//  TennisTests
//
//  Created by 2019_DEV_157 on 09/05/2019.
//  Copyright © 2019 2019_DEV_157. All rights reserved.
//

import XCTest

class ScoreTests: XCTestCase {
    
    func testHasWinner(){
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.firstPlayer)
        
        XCTAssert(Score().hasWinner(game: game) == true)
    }
    
    func testIsDeuce(){
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        //1-1
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        // 2-2
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        // 3-3
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        // 4-4
        
        XCTAssert(Score().isDeuce(game: game) == true)
    }
    
    func testHasAdvantage(){
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        let score = Score.shared
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        //1-1
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        // 2-2
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        // 3-3
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        // 4-4
        game.playerWinPoint(player: game.firstPlayer)
        // Adv playerOne
        
        XCTAssert(score.hasAdvantage(game: game) == true)
        XCTAssert(score.getPlayerWithHighestScore(game: game) === playerOne)
    }
    
    func testPlayerWithHighestScore(){
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        
        if let playerWithHighestScore = Score().getPlayerWithHighestScore(game: game){
            print(playerWithHighestScore.name)
            
            XCTAssert(playerWithHighestScore === game.secondPlayer)
        }else{
            print(game.firstPlayer.points == game.secondPlayer.points)
            print("Both player have the same score")
        }
    }
    
    func testGetScore(){
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        let score = Score.shared
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(score.getScore(game: game) == "Fifteen - Fifteen")
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(score.getScore(game: game) == "Thirty - Thirty")
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(score.getScore(game: game) == "Deuce")
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(score.getScore(game: game) == "Advantage Player 2")
        game.playerWinPoint(player: game.firstPlayer)
        XCTAssert(score.getScore(game: game) == "Deuce")
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(score.getScore(game: game) == "Advantage Player 2")
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(score.getScore(game: game) == "Player 2 wins")
    }
}
