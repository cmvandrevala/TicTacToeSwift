import TicTacToe
import Quick
import Nimble

class GameSpec: QuickSpec {

    override func spec() {
        describe("Making a move") {
            var board: Board!
            var game: Game!

            beforeEach() {
                board = Board()
                game = Game(board: board)
            }

            it("updates the board with X") {
                game.makeMove(2)

                expect(board.tokenAt(2)).to(equal(PlayerToken.X))
            }

            it("updates the board with O") {
                game.makeMove(2)

                game.makeMove(3)

                expect(board.tokenAt(3)).to(equal(PlayerToken.O))
            }

            it("swaps back to X after O's turn") {
                game.makeMove(2)
                game.makeMove(3)

                game.makeMove(1)

                expect(board.tokenAt(1)).to(equal(PlayerToken.X))
            }
        }
    }
    
}
