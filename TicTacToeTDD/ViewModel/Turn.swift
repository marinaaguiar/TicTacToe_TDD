//
//  Turn.swift
//  TicTacToeTDD
//
//  Created by Marina Aguiar on 7/11/23.
//

import Foundation

struct Turn {

    private var playerTurn: Player
    var getCurrentPlayer: Player {
        return playerTurn
    }

    init() {
        self.playerTurn = .playerX
    }

    mutating func update() {
        if playerTurn == .playerX {
            playerTurn = .playerO
        } else {
            playerTurn = .playerX
        }
    }
}
