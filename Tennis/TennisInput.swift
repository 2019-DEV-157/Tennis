//
//  tennisInput.swift
//  Tennis
//
//  Created by 2019_DEV_157 on 09/05/2019.
//  Copyright © 2019 2019_DEV_157. All rights reserved.
//

import Foundation

class TennisInput {
    
    private func getInput() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
    
    func printMessageWithAnswer(message: String) -> String{
        print(message)
        let answer = getInput()
        return answer
    }
    
    func selectPlayerWhoScore(firstPlayer: Player, secondPlayer: Player) -> Player{
        let firstPlayerNumber = 1
        let secondPlayerNumber = 2
        
        let message = "Select the player who won the point: write \(firstPlayerNumber) for \(firstPlayer.name) & \(secondPlayerNumber) for \(secondPlayer.name)"
        var answer: String
        
        repeat {
            answer = printMessageWithAnswer(message: message)
        }
            while( !checkValidyOfAnswer(answer: answer) )
        
        if answer == "1"{
            return firstPlayer
        }else{
            return secondPlayer
        }
    }
    
    private func checkValidyOfAnswer(answer: String) -> Bool{
        return answer == "1" || answer == "2"
    }
}
