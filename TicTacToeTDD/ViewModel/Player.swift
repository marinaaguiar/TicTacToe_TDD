//
//  Player.swift
//  TicTacToeTDD
//
//  Created by Marina Aguiar on 7/11/23.
//

import Foundation

enum Player {
    case playerX, playerO, none

    var symbol: String {
        switch self {
        case .playerX:
            return "x.square.fill"
        case .playerO:
            return "o.square.fill"
        case .none:
            return "square.fill"
        }
    }
}
