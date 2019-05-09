//
//  GameTests.swift
//  TennisTests
//
//  Created by 2019_DEV_157 on 08/05/2019.
//  Copyright © 2019 2019_DEV_157. All rights reserved.
//

import XCTest

class GameTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGameInit() {
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        
        XCTAssert(game.firstPlayer === playerOne)
    }
    
    func testPlayerWinPoint(){
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        game.playerWinPoint(player: game.firstPlayer)
        
        XCTAssert(game.firstPlayer.points == 1)
        XCTAssert(game.secondPlayer.points == 0)
    }
    
    func testGetScore(){
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
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
}
