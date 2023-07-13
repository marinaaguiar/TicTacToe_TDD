//
//  GameState.swift
//  TicTacToeTDD
//
//  Created by Marina Aguiar on 7/11/23.
//

import Foundation

enum GameState: Hashable {
    case idle, playerWin(Player), tie
}
