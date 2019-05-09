//
//  Player.swift
//  Tennis
//
//  Created by 2019_DEV_157 on 08/05/2019.
//  Copyright © 2019 2019_DEV_157. All rights reserved.
//

import Foundation

public class Player {
    
    private (set) var name:String
    var points:Int
    
    public init(playerName:String) {
        self.name = playerName
        self.points = Constants.START_SCORE
    }
}
