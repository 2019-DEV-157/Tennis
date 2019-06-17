//
//  PlayerTests.swift
//  TennisTests
//
//  Created by 2019_DEV_157 on 08/05/2019.
//  Copyright © 2019 2019_DEV_157. All rights reserved.
//

import XCTest

class PlayerTests: XCTestCase {
    
    var player: Player!
    
    override func setUp() {
        player = Player(playerName: "John")
    }
    
    override func tearDown() {
        player = nil
    }

    func testPlayerInit() {
        
        XCTAssert(player.name == "John")
        XCTAssert(player.points == 0)
    }
}
