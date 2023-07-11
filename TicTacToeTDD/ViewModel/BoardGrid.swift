//
//  BoardGrid.swift
//  TicTacToeTDD
//
//  Created by Marina Aguiar on 7/11/23.
//

import Foundation


class BoardGrid {

    let numberOfRows: Int = 3
    lazy var numberOfColumns: Int = {
        return numberOfRows
    }()
    lazy var grid: [[Move]] = []

    init() {
        populateGrid()
    }

    func populateGrid() {
        for row in 0..<numberOfRows {
            var newRow: [Move] = []
            for col in 0..<numberOfRows {
                let move = Move(position: Position(row: row, column: col), player: .none)
                newRow.append(move)
            }
            grid.append(newRow)
        }
        print(grid)
    }


    func isCellEmpty(position: Position) -> Bool {
        return grid[position.row][position.column].player  == .none
    }

    func updateCellOnGrid(move: Move) {
        let row = move.position.row
        let column = move.position.column
        if isCellEmpty(position: move.position) {
            grid[row][column].player = move.player
        }
    }
}
