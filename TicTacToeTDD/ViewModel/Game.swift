//
//  Game.swift
//  TicTacToeTDD
//
//  Created by Marina Aguiar on 7/11/23.
//

import Foundation

class Game {

    var boardGrid: BoardGrid
    private var playerTurn: Turn
    var currentPlayer: Player {
        return playerTurn.getCurrentPlayer
    }

    init(boardGrid: BoardGrid) {
        self.boardGrid = BoardGrid()
        self.playerTurn = Turn()
    }

    func startGame() {
        boardGrid = BoardGrid()
        playerTurn = Turn()
    }

    func playMove(at position: Position) {
        boardGrid.updateCellOnGrid(move: Move(position: position, player: currentPlayer))
        playerTurn.update()
    }

}
