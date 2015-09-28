//
//  RPSMatch.swift
//  Roshambo
//
//  Created by Jason Schatz on 9/28/15.
//  Copyright (c) 2015 Jason Schatz. All rights reserved.
//

import Foundation

struct RPSMatch: Printable {
    
    let player1: RPS
    let player2: RPS
    
    var description: String {
        
        if (player1 == player2) {
            return "\(player1) ties with \(player2)"
        }
        
        else if (player1 > player2) {
            return "\(player1) \(victoryPrase(player1)) \(player2)"
        }
        
        else {
            return "\(player1) \(defeatPhrase(player2)) \(player2)"
        }
    }
    
    private func victoryPrase(rps: RPS) -> String {
        switch rps {
        case .Rock:
            return "crushes"
        case .Scissors:
            return "cuts"
        case .Paper:
            return "covers"
        }
    }
    
    private func defeatPhrase(rps: RPS) -> String {
        switch rps {
        case .Rock:
            return "is crushed by"
        case .Scissors:
            return "is cut by"
        case .Paper:
            return "is covered by"
        }
    }
}