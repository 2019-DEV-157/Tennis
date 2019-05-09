//
//  ScoreTests.swift
//  TennisTests
//
//  Created by 2019_DEV_157 on 09/05/2019.
//  Copyright © 2019 2019_DEV_157. All rights reserved.
//

import XCTest

class ScoreTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHasWinner(){
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerOne)
        
        XCTAssert(Score().hasWinner(game: game) == true)
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
        
        XCTAssert(Score().isDeuce(game: game) == true)
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
        
        XCTAssert(Score().hasAdvantage(game: game) == true)
        XCTAssert(Score().getPlayerWithHighestScore(game: game) === playerOne)
    }
    
    func testPlayerWithHighestScore(){
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerTwo)
        
        if let playerWithHighestScore = Score().getPlayerWithHighestScore(game: game){
            print(playerWithHighestScore.name)
            
            XCTAssert(playerWithHighestScore === game.playerTwo)
        }else{
            print(game.playerOne.points == game.playerTwo.points)
            print("Both player have the same score")
        }
    }
    
    func testGetScore(){
        let playerOne = Player(playerName: "Player 1")
        let playerTwo = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerTwo)
        XCTAssert(Score().getScore(game: game) == "1 - 1")
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerTwo)
        XCTAssert(Score().getScore(game: game) == "2 - 2")
        game.playerWinPoint(player: game.playerOne)
        game.playerWinPoint(player: game.playerTwo)
        XCTAssert(Score().getScore(game: game) == "Deuce")
        game.playerWinPoint(player: game.playerTwo)
        XCTAssert(Score().getScore(game: game) == "Advantage Player 2")
        game.playerWinPoint(player: game.playerOne)
        XCTAssert(Score().getScore(game: game) == "Deuce")
        game.playerWinPoint(player: game.playerTwo)
        XCTAssert(Score().getScore(game: game) == "Advantage Player 2")
        game.playerWinPoint(player: game.playerTwo)
        XCTAssert(Score().getScore(game: game) == "Player 2 wins")
    }
}
