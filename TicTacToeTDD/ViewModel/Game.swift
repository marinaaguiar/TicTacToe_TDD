//
//  Game.swift
//  TicTacToeTDD
//
//  Created by Marina Aguiar on 7/11/23.
//

import Foundation

final class Game: ObservableObject {

    @Published private var boardGrid: BoardGrid
    lazy var grid: [[Move]] = {
        return boardGrid.grid
    }()
    private var playerTurn: Turn

    var currentPlayer: Player {
        return playerTurn.getCurrentPlayer
    }
    private var gameState: GameState
    var currentGameState: GameState {
        return gameState
    }

    init() {
        self.boardGrid = BoardGrid()
        self.playerTurn = Turn()
        self.gameState = .idle
        self.grid = boardGrid.grid
    }

    func startGame() {
        boardGrid = BoardGrid()
        playerTurn = Turn()
        gameState = .idle
    }

    func playMove(at position: Position) {
        let move = Move(position: position, player: currentPlayer)
        boardGrid.updateCellOnGrid(move: move)
        updateGameState(move: move)

        if !isGameOver() {
            playerTurn.update()
        }
    }

    private func isGameOver() -> Bool {
        return gameState != .idle
    }

    private func updateGameState(move: Move) {
        let gameRules = Rules(boardGrid: boardGrid)
        gameState = gameRules.applyRules(move: Move(position: move.position, player: currentPlayer))
    }

}
