//
//  RulesTests.swift
//  TicTacToeTDDTests
//
//  Created by Marina Aguiar on 7/11/23.
//
@testable import TicTacToeTDD
import XCTest

final class RulesTests: XCTestCase {

    var rules: Rules!
    var boardGrid: BoardGrid!

    override func setUp() {
        super.setUp()
        boardGrid = BoardGrid()
        rules = Rules(boardGrid: boardGrid)
    }

    override func tearDown() {
        rules = nil
        boardGrid = nil
        super.tearDown()
    }

    func testBoardGridIsFilled() {
        for row in 0..<boardGrid.numberOfRows {
            for col in 0..<boardGrid.numberOfColumns {
                boardGrid.updateCellOnGrid(
                    move: Move(
                    position: Position(
                        row: row,
                        column: col),
                    player: .playerX)
                )
            }
        }

        let lastMove = Move(position: Position(row: 2, column: 2), player: .playerX)
        let state = rules.applyRules(move: lastMove)

        XCTAssertEqual(GameState.tie, state)
    }

    func testRowFilled() {
        let row: Int = 2
        for col in 0..<boardGrid.numberOfColumns {
            boardGrid.updateCellOnGrid(move: Move(position:Position(row: row, column: col), player: .playerX))
        }
        let lastMove = Move(position: Position(row: row, column: 2), player: .playerX)
        let state = rules.applyRules(move: lastMove)
        XCTAssertEqual(GameState.playerWin(.playerX), state)
    }

    func testColumnFilled() {
        let column: Int = 1
        for row in 0..<boardGrid.numberOfColumns {
            boardGrid.updateCellOnGrid(move: Move(position:Position(row: row, column: column), player: .playerX))
        }
        let lastMove = Move(position: Position(row: 2, column: column), player: .playerX)
        let state = rules.applyRules(move: lastMove)
        XCTAssertEqual(GameState.playerWin(.playerX), state)
    }

    func testRightDiagonalFilled() {
        for row in 0..<boardGrid.numberOfColumns {
            boardGrid.updateCellOnGrid(move: Move(position:Position(row: row, column: row), player: .playerX))
        }
        let lastMove = Move(position: Position(row: 2, column: 2), player: .playerX)
        let state = rules.applyRules(move: lastMove)
        XCTAssertEqual(GameState.playerWin(.playerX), state)
    }

    func testLeftDiagonalFilled() {
        var col = 2
        for row in 0..<boardGrid.numberOfRows {
            boardGrid.updateCellOnGrid(move: Move(position:Position(row: row, column: col), player: .playerX))
            col -= 1
        }
        let lastMove = Move(position: Position(row: 2, column: 0), player: .playerX)
        let state = rules.applyRules(move: lastMove)
        XCTAssertEqual(GameState.playerWin(.playerX), state)
    }
}
