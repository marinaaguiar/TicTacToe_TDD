//
//  Move.swift
//  TicTacToeTDD
//
//  Created by Marina Aguiar on 7/11/23.
//

import Foundation

struct Move {
    let position: Position
    var player: Player
}

struct Position {
    let row: Int
    let column: Int
}
