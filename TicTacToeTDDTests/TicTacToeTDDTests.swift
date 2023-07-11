//
//  TicTacToeTDDTests.swift
//  TicTacToeTDDTests
//
//  Created by Marina Aguiar on 7/11/23.
//
@testable import TicTacToeTDD
import XCTest

final class GameTests: XCTestCase {

    var game: Game!

    override func setUp() {
        super.setUp()
        game = Game(boardGrid: BoardGrid())
    }

    override func tearDown() {
        game = nil
        super.tearDown()
    }

    func testGameStartWithPlayerX() {
        game.startGame()
        XCTAssertEqual(Player.playerX, game.currentPlayer)
    }

    func testCheckIfCellUpdatesAfterPlayMove() {
        let position = Position(row: 0, column: 0)
        let boardGrid = game.boardGrid
        game.playMove(at: position)

        XCTAssertNotEqual(Player.none, boardGrid.grid[position.row][position.column].player)
    }

    func testPlayerTurnChangesAfterPlayMove() {
        let previousPlayerTurn = game.currentPlayer
        let position = Position(row: 0, column: 0)
        game.playMove(at: position)

        XCTAssertNotEqual(previousPlayerTurn, game.currentPlayer)
    }


}
