//
//  TurnTests.swift
//  TicTacToeTDDTests
//
//  Created by Marina Aguiar on 7/11/23.
//
@testable import TicTacToeTDD

import XCTest

final class TurnTests: XCTestCase {

    var turn: Turn!

    override func setUp() {
        super.setUp()
        turn = Turn()
    }

    override func tearDown() {
        turn = nil
        super.tearDown()
    }

    func testUpdatePlayerTurn() {
        let firstPlayerTurn = turn.getCurrentPlayer
        turn.update()
        XCTAssertNotEqual(firstPlayerTurn, turn.getCurrentPlayer)
    }
}
