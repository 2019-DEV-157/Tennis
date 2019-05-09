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
        
        XCTAssert(game.playerOne === playerOne)
    }
    
    func testPlayerWinPoint(){
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        game.playerWinPoint(player: game.playerOne)
        
        XCTAssert(game.playerOne.points == 1)
        XCTAssert(game.playerTwo.points == 0)
    }
    
    func testPlayerWithHighestScore(){
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerTwo)
        
        if let playerWithHighestScore = game.getPlayerWithHighestScore(){
            print(playerWithHighestScore.name)

            XCTAssert(playerWithHighestScore === game.playerTwo)
        }else{
            print(game.playerOne.points == game.playerTwo.points)
            print("Both player have the same score")
        }
    }
    
    func testHasWinner(){
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerOne)
//        game.playerWinPoint(player: game.playerOne)

        XCTAssert(game.hasWinner() == true)
    }
    
    func testIsDeuce(){
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerTwo)
        //1-1
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerTwo)
        // 2-2
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerTwo)
        // 3-3
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerTwo)
        // 4-4
        
        XCTAssert(game.isDeuce() == true)
    }
    
    func testHasAdvantage(){
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerTwo)
        //1-1
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerTwo)
        // 2-2
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerTwo)
        // 3-3
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerTwo)
        // 4-4
        game.playerWinPoint(player: game.playerOne)
        // Adv playerOne
        
        XCTAssert(game.hasAdvantage() == true)
        XCTAssert(game.getPlayerWithHighestScore() === playerOne)
    }
    
    func testGetScore(){
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        game.playerWinPoint(player: game.playerOne)
        XCTAssert(game.getScore() == "1 - 0")
        game.playerWinPoint(player: game.playerTwo)
        XCTAssert(game.getScore() == "1 - 1")
        game.playerWinPoint(player: game.playerTwo)
        XCTAssert(game.getScore() == "1 - 2")
        game.playerWinPoint(player: game.playerTwo)
        XCTAssert(game.getScore() == "1 - 3")
        game.playerWinPoint(player: game.playerTwo)
        XCTAssert(game.getScore() == "Player 2 wins")
        
        let newPlayerOne = Player(playerName: "Player One")
        let newPlayerTwo = Player(playerName: "Player Two")

        let newGame = Game(firstPlayer: newPlayerOne, secondPlayer: newPlayerTwo)
        newGame.playerWinPoint(player: newGame.playerOne)
        newGame.playerWinPoint(player: newGame.playerTwo)
        XCTAssert(newGame.getScore() == "1 - 1")
        newGame.playerWinPoint(player: newGame.playerOne)
        newGame.playerWinPoint(player: newGame.playerTwo)
        XCTAssert(newGame.getScore() == "2 - 2")
        newGame.playerWinPoint(player: newGame.playerOne)
        newGame.playerWinPoint(player: newGame.playerTwo)
        XCTAssert(newGame.getScore() == "Deuce")
        newGame.playerWinPoint(player: newGame.playerTwo)
        XCTAssert(newGame.getScore() == "Advantage Player Two")
        newGame.playerWinPoint(player: newGame.playerOne)
        XCTAssert(newGame.getScore() == "Deuce")
        newGame.playerWinPoint(player: newGame.playerTwo)
        XCTAssert(newGame.getScore() == "Advantage Player Two")
        newGame.playerWinPoint(player: newGame.playerTwo)
        XCTAssert(newGame.getScore() == "Player Two wins")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
