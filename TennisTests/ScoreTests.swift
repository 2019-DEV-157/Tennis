//
//  ScoreTests.swift
//  TennisTests
//
//  Created by 2019_DEV_157 on 09/05/2019.
//  Copyright © 2019 2019_DEV_157. All rights reserved.
//

import XCTest

class ScoreTests: XCTestCase {
    
    var playerOne: Player!
    var playerTwo: Player!
    
    var game : Game!
    
    override func setUp() {
        playerOne = Player(playerName: "Player 1")
        playerTwo = Player(playerName: "Player 2")
        
        game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
    }
    
    override func tearDown() {
        playerOne = nil
        playerTwo = nil
        game = nil
    }
    
    func testHasWinner(){
       
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.firstPlayer)
        
        XCTAssertTrue(Score().hasWinner(game: game))
    }
    
    func testIsDeuce(){
      
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
        
        XCTAssertTrue(Score().isDeuce(game: game))
    }
    
    func testHasAdvantage(){
        
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
        
        XCTAssertTrue(Score().hasAdvantage(game: game))
        XCTAssert(Score().getPlayerWithHighestScore(game: game) == playerOne)
    }
    
    func testPlayerOneWithHighestScore(){
       
        game.playerWinPoint(player: game.firstPlayer)
        XCTAssert(Score().getPlayerWithHighestScore(game: game) == game.firstPlayer)
    }
    
    func testPlayerTwoWithHighestScore(){
        
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(Score().getPlayerWithHighestScore(game: game) == game.secondPlayer)
    }
    
    func testGetScore(){
       
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(Score().getScore(game: game) == "Fifteen - Fifteen")
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(Score().getScore(game: game) == "Thirty - Thirty")
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(Score().getScore(game: game) == "Deuce")
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(Score().getScore(game: game) == "Advantage Player 2")
        game.playerWinPoint(player: game.firstPlayer)
        XCTAssert(Score().getScore(game: game) == "Deuce")
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(Score().getScore(game: game) == "Advantage Player 2")
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(Score().getScore(game: game) == "Player 2 wins")
    }
}
