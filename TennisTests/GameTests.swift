//
//  GameTests.swift
//  TennisTests
//
//  Created by 2019_DEV_157 on 08/05/2019.
//  Copyright © 2019 2019_DEV_157. All rights reserved.
//

import XCTest

class GameTests: XCTestCase {
    
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

    func testGameInit() {
        
        XCTAssert(game.firstPlayer == playerOne)
    }
    
    func testPlayerWinPoint(){
        
        game.playerWinPoint(player: game.firstPlayer)
        
        XCTAssert(game.firstPlayer.points == 1)
        XCTAssert(game.secondPlayer.points == 0)
    }
    
    func testGetScore(){
        
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(game.getScore() == "Fifteen - Fifteen")
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(game.getScore() == "Thirty - Thirty")
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(game.getScore() == "Deuce")
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(game.getScore() == "Advantage Player 2")
        game.playerWinPoint(player: game.firstPlayer)
        XCTAssert(game.getScore() == "Deuce")
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(game.getScore() == "Advantage Player 2")
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(game.getScore() == "Player 2 wins")
    }
    
    func testGameHasNotEnded(){
        XCTAssertFalse(game.hasEnded())
    }
    
    func testGameHasEnded(){
        
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(game.getScore() == "Fifteen - Fifteen")
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(game.getScore() == "Thirty - Thirty")
        game.playerWinPoint(player: game.firstPlayer)
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(game.getScore() == "Deuce")
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(game.getScore() == "Advantage Player 2")
        game.playerWinPoint(player: game.firstPlayer)
        XCTAssert(game.getScore() == "Deuce")
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(game.getScore() == "Advantage Player 2")
        XCTAssertFalse(game.hasEnded())
        game.playerWinPoint(player: game.secondPlayer)
        XCTAssert(game.getScore() == "Player 2 wins")
        XCTAssertTrue(game.hasEnded())
    }
}
