//
//  PlayerTests.swift
//  TennisTests
//
//  Created by 2019_DEV_157 on 08/05/2019.
//  Copyright © 2019 2019_DEV_157. All rights reserved.
//

import XCTest

class PlayerTests: XCTestCase {

    func testPlayerInit() {
        let newPlayer = Player(playerName: "John")
        XCTAssert(newPlayer.name == "John")
    }
}
