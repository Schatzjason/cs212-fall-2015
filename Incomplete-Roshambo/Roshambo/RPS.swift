//
//  RPS.swift
//  Roshambo
//
//  Created by Jason Schatz on 9/28/15.
//  Copyright (c) 2015 Jason Schatz. All rights reserved.
//

import Foundation

enum RPS: Printable, Comparable {
    
    case Rock, Paper, Scissors
    
    init() {
        let random = Int(arc4random()) % 3
        
        switch random {
        case 0:
            self = .Rock
        case 1:
            self = .Paper
        default:
            self = .Scissors
        }
    }
    
    var description: String {
        switch self {
        case .Rock:
            return "Rock"
        case .Scissors:
            return "Scissors"
        case .Paper:
            return "Paper"
        }
    }
}

func < (lhs: RPS, rhs: RPS) -> Bool {
    
    switch (lhs, rhs) {
    case (.Rock, .Paper), (.Paper, .Scissors), (.Scissors, .Rock):
        return true
    default:
        return false
    }
}

func == (lhs: RPS, rhs: RPS) -> Bool {
    switch (lhs, rhs) {
    case (.Rock, .Rock), (.Scissors, .Scissors), (.Paper, .Paper):
        return true
    default:
        return false
    }
}


