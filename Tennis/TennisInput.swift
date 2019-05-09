//
//  tennisInput.swift
//  Tennis
//
//  Created by 2019_DEV_157 on 09/05/2019.
//  Copyright © 2019 2019_DEV_157. All rights reserved.
//

import Foundation

public class TennisInput {
    
    func getInput() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
}
