//
//  ContentView.swift
//  TicTacToeTDD
//
//  Created by Marina Aguiar on 7/11/23.
//

import SwiftUI

struct TicTacToeView: View {

    @ObservedObject private var viewModel = Game()

    let columns = [
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil)
    ]

    var body: some View {
        NavigationView {
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 10,
                pinnedViews: [],
                content: {

                    ForEach(0..<viewModel.grid.count) { rowIndex in
                        ForEach(0..<viewModel.grid[rowIndex].count) { columnIndex in
                            CellView(move: $viewModel.grid[rowIndex][columnIndex])
                                .onTapGesture {
                                    print("item \(rowIndex) \(columnIndex)")
                                    viewModel.playMove(at: Position(row: rowIndex, column: columnIndex))
                                }
                        }
                    }
                })
            .navigationTitle("Tic Tac Toe")
            .navigationBarItems(trailing: Button("Reset", action: {
                viewModel.startGame()
                print("reset button pressed")
            }))
        }
        .padding(EdgeInsets(top: 0, leading: 12, bottom: 100, trailing: 12))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView()
    }
}

struct CellView: View {
    @Binding var move: Move

    var body: some View {
        Image(systemName: "\(move.player.symbol)")
            .renderingMode(.original)
            .resizable()
            .foregroundColor(.pink)
            .aspectRatio(contentMode: .fit)
    }
}
