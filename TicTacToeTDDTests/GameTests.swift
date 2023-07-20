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

    func testGameStartWithIdleState() {
        game.startGame()
        XCTAssertEqual(GameState.idle, game.currentGameState)
    }

    func testCheckIfCellUpdatesAfterPlayMove() {
        let position = Position(row: 0, column: 0)
        let grid = game.grid
        game.playMove(at: position)

        XCTAssertNotEqual(Player.none, grid[position.row][position.column].player)
    }

    func testPlayerTurnChangesAfterPlayMove() {
        let previousPlayerTurn = game.currentPlayer
        let position = Position(row: 0, column: 0)
        game.playMove(at: position)

        XCTAssertNotEqual(previousPlayerTurn, game.currentPlayer)
    }

    func testGameStateWhenPlayerXWinsOnFirstRow() {
        let currentPlayer = game.currentPlayer

        let move1 = Move(position: Position(row: 0, column: 0), player: currentPlayer)
        game.playMove(at: move1.position)
        let move2 = Move(position: Position(row: 1, column: 1), player: currentPlayer)
        game.playMove(at: move2.position)
        let move3 = Move(position: Position(row: 0, column: 1), player: currentPlayer)
        game.playMove(at: move3.position)
        let move4 = Move(position: Position(row: 2, column: 2), player: currentPlayer)
        game.playMove(at: move4.position)
        let move5 = Move(position: Position(row: 0, column: 2), player: currentPlayer)
        game.playMove(at: move5.position)
        XCTAssertEqual(GameState.playerWin(.playerX), game.currentGameState)
    }

    func testGameStateWhenPlayerOWinsOnFirstRow() {
        let currentPlayer = game.currentPlayer

        let move1 = Move(position: Position(row: 1, column: 1), player: currentPlayer)
        game.playMove(at: move1.position)
        let move2 = Move(position: Position(row: 0, column: 0), player: currentPlayer)
        game.playMove(at: move2.position)
        let move3 = Move(position: Position(row: 2, column: 2), player: currentPlayer)
        game.playMove(at: move3.position)
        let move4 = Move(position: Position(row: 0, column: 1), player: currentPlayer)
        game.playMove(at: move4.position)
        let move5 = Move(position: Position(row: 1, column: 2), player: currentPlayer)
        game.playMove(at: move5.position)
        let move6 = Move(position: Position(row: 0, column: 2), player: currentPlayer)
        game.playMove(at: move6.position)

        XCTAssertEqual(GameState.playerWin(.playerO), game.currentGameState)
    }

    func testGameStateWhenPlayerXWinsOnFirstColumn() {
        let currentPlayer = game.currentPlayer

        let move1 = Move(position: Position(row: 0, column: 0), player: currentPlayer)
        game.playMove(at: move1.position)
        let move2 = Move(position: Position(row: 1, column: 1), player: currentPlayer)
        game.playMove(at: move2.position)
        let move3 = Move(position: Position(row: 1, column: 0), player: currentPlayer)
        game.playMove(at: move3.position)
        let move4 = Move(position: Position(row: 2, column: 2), player: currentPlayer)
        game.playMove(at: move4.position)
        let move5 = Move(position: Position(row: 2, column: 0), player: currentPlayer)
        game.playMove(at: move5.position)
        XCTAssertEqual(GameState.playerWin(.playerX), game.currentGameState)
    }

    func testGameStateWhenPlayerOWinsOnLastColumn() {
        let currentPlayer = game.currentPlayer

        let move1 = Move(position: Position(row: 1, column: 1), player: currentPlayer)
        game.playMove(at: move1.position)
        let move2 = Move(position: Position(row: 0, column: 2), player: currentPlayer)
        game.playMove(at: move2.position)
        let move3 = Move(position: Position(row: 2, column: 0), player: currentPlayer)
        game.playMove(at: move3.position)
        let move4 = Move(position: Position(row: 1, column: 2), player: currentPlayer)
        game.playMove(at: move4.position)
        let move5 = Move(position: Position(row: 1, column: 0), player: currentPlayer)
        game.playMove(at: move5.position)
        let move6 = Move(position: Position(row: 2, column: 2), player: currentPlayer)
        game.playMove(at: move6.position)

        XCTAssertEqual(GameState.playerWin(.playerO), game.currentGameState)
    }

    func testGameStateWhenPlayerXWinsOnRightDiagonal() {
        let currentPlayer = game.currentPlayer

        let move1 = Move(position: Position(row: 0, column: 0), player: currentPlayer)
        game.playMove(at: move1.position)
        let move2 = Move(position: Position(row: 0, column: 2), player: currentPlayer)
        game.playMove(at: move2.position)
        let move3 = Move(position: Position(row: 1, column: 1), player: currentPlayer)
        game.playMove(at: move3.position)
        let move4 = Move(position: Position(row: 1, column: 2), player: currentPlayer)
        game.playMove(at: move4.position)
        let move5 = Move(position: Position(row: 2, column: 2), player: currentPlayer)
        game.playMove(at: move5.position)

        XCTAssertEqual(GameState.playerWin(.playerX), game.currentGameState)
    }

    func testGameStateWhenPlayerOWinsOnRightDiagonal() {
        let currentPlayer = game.currentPlayer

        let move1 = Move(position: Position(row: 1, column: 2), player: currentPlayer)
        game.playMove(at: move1.position)
        let move2 = Move(position: Position(row: 0, column: 0), player: currentPlayer)
        game.playMove(at: move2.position)
        let move3 = Move(position: Position(row: 2, column: 0), player: currentPlayer)
        game.playMove(at: move3.position)
        let move4 = Move(position: Position(row: 1, column: 1), player: currentPlayer)
        game.playMove(at: move4.position)
        let move5 = Move(position: Position(row: 1, column: 0), player: currentPlayer)
        game.playMove(at: move5.position)
        let move6 = Move(position: Position(row: 2, column: 2), player: currentPlayer)
        game.playMove(at: move6.position)

        XCTAssertEqual(GameState.playerWin(.playerO), game.currentGameState)
    }

    func testGameStateWhenPlayerXWinsOnLeftDiagonal() {
        let currentPlayer = game.currentPlayer

        let move1 = Move(position: Position(row: 0, column: 2), player: currentPlayer)
        game.playMove(at: move1.position)
        let move2 = Move(position: Position(row: 2, column: 2), player: currentPlayer)
        game.playMove(at: move2.position)
        let move3 = Move(position: Position(row: 1, column: 1), player: currentPlayer)
        game.playMove(at: move3.position)
        let move4 = Move(position: Position(row: 1, column: 2), player: currentPlayer)
        game.playMove(at: move4.position)
        let move5 = Move(position: Position(row: 2, column: 0), player: currentPlayer)
        game.playMove(at: move5.position)

        XCTAssertEqual(GameState.playerWin(.playerX), game.currentGameState)
    }

    func testGameStateWhenPlayerOWinsOnLeftDiagonal() {
        let currentPlayer = game.currentPlayer

        let move1 = Move(position: Position(row: 1, column: 2), player: currentPlayer)
        game.playMove(at: move1.position)
        let move2 = Move(position: Position(row: 0, column: 2), player: currentPlayer)
        game.playMove(at: move2.position)
        let move3 = Move(position: Position(row: 2, column: 2), player: currentPlayer)
        game.playMove(at: move3.position)
        let move4 = Move(position: Position(row: 1, column: 1), player: currentPlayer)
        game.playMove(at: move4.position)
        let move5 = Move(position: Position(row: 1, column: 0), player: currentPlayer)
        game.playMove(at: move5.position)
        let move6 = Move(position: Position(row: 2, column: 0), player: currentPlayer)
        game.playMove(at: move6.position)

        XCTAssertEqual(GameState.playerWin(.playerO), game.currentGameState)
    }
}


