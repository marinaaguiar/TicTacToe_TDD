//
//  BoardGridTests.swift
//  TicTacToeTDDTests
//
//  Created by Marina Aguiar on 7/11/23.
//
@testable import TicTacToeTDD
import XCTest

final class BoardGridTests: XCTestCase {

    var boardGrid: BoardGrid!

    override func setUp() {
        super.setUp()
        boardGrid = BoardGrid()
    }

    override func tearDown() {
        boardGrid = nil
        super.tearDown()
    }

    func testCheckGridCellCount() {
        let grid = boardGrid.grid.flatMap { $0 }
        let cellsCount = boardGrid.numberOfRows * boardGrid.numberOfColumns
        XCTAssertEqual(cellsCount, grid.count)
    }

    func testBoardGridStartsWithEmptyPlayers() {
        for row in 0..<boardGrid.numberOfRows {
            for col in 0..<boardGrid.numberOfColumns {
                XCTAssertTrue(boardGrid.isCellEmpty(position: Position(row: row, column: col)))
            }
        }
    }

}
