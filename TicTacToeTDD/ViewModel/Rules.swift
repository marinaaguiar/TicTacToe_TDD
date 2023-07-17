//
//  GameCalculator.swift
//  TicTacToeTDD
//
//  Created by Marina Aguiar on 7/11/23.
//

import Foundation

struct Rules {

    var boardGrid: BoardGrid

    init(boardGrid: BoardGrid) {
        self.boardGrid = boardGrid
    }

    func applyRules(move: Move) -> GameState {
        let position = move.position
        let player = move.player

        if isBoardGridFilled() {
            return .tie
        }

        if hasRowFilled(for: position.row, player: move.player) {
            return .playerWin(player)
        }

        if hasColumnFilled(for: position.column, player: player) {
            return .playerWin(player)
        }

        if hasRightDiagonalFilled(player: player) {
            return .playerWin(player)
        }

        if hasLeftDiagonalFilled(player: player) {
            return .playerWin(player)
        }

        return .idle
    }

    private func hasRowFilled(for row: Int, player: Player) -> Bool {
        if boardGrid.grid[row].allSatisfy({ $0.player == player }) {
            return true
        }
        return false
    }

    private func hasColumnFilled(for column: Int, player: Player) -> Bool {
        var winnerColumn: [Move] = []
        for row in 0..<boardGrid.numberOfRows {
            let cell = boardGrid.grid[row][column]
            if cell.player == player {
                winnerColumn.append(cell)
            }
        }
        return winnerColumn.count == boardGrid.numberOfColumns
    }

    private func hasRightDiagonalFilled(player: Player) -> Bool {
        var winnerDiagonal: [Move] = []
        for row in 0..<boardGrid.numberOfRows {
            for col in 0..<boardGrid.numberOfColumns {
                if row == col {
                    let cell = boardGrid.grid[row][col]
                    if cell.player == player {
                        winnerDiagonal.append(cell)
                    }
                }
            }
        }
        return winnerDiagonal.count == boardGrid.numberOfColumns
    }

    private func hasLeftDiagonalFilled(player: Player) -> Bool {
        var winnerDiagonal: [Move] = []
        var col = 2

        for row in 0..<boardGrid.numberOfRows {
            let cell = boardGrid.grid[row][col]
            if cell.player == player {
                winnerDiagonal.append(cell)
            }
            col -= 1
        }
        return winnerDiagonal.count == boardGrid.numberOfColumns
    }

    private func isBoardGridFilled() -> Bool {
        let flatGrid = boardGrid.grid.flatMap({ $0 })
        return flatGrid.allSatisfy({ $0.player != .none})
    }
}
