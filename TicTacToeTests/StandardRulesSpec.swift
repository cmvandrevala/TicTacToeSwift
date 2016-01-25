import TicTacToe
import Quick
import Nimble

class StandardRulesSpec: QuickSpec {

    override func spec() {
        describe("The current status") {
            func currentStatus(board: Board) -> GameStatus {
                return StandardRules().determineStatus(board)
            }

            var board: Board!

            beforeEach() {
                board = Board()
            }

            it("is 'In Progress' for an empty board") {
                expect(currentStatus(board)).to(equal(GameStatus.InProgress))
            }

            it("has player one for a winner in a row") {
                board.place(.X, at: 0)
                board.place(.X, at: 1)
                board.place(.X, at: 2)

                expect(currentStatus(board)).to(equal(GameStatus.PlayerOneWins))
            }

            it("has player two for a winner in a row") {
                board.place(.O, at: 0)
                board.place(.O, at: 1)
                board.place(.O, at: 2)

                expect(currentStatus(board)).to(equal(GameStatus.PlayerTwoWins))
            }

            it("is a draw for a full board with no winner") {
                // O | X | X
                // X | X | O
                // O | O | X
                board.place(.X, at: 1)
                board.place(.X, at: 2)
                board.place(.X, at: 3)
                board.place(.X, at: 4)
                board.place(.X, at: 8)

                board.place(.O, at: 0)
                board.place(.O, at: 5)
                board.place(.O, at: 6)
                board.place(.O, at: 7)

                expect(currentStatus(board)).to(equal(GameStatus.Draw))
            }

            it("has player one for a winner in a col") {
                board.place(.X, at: 0)
                board.place(.X, at: 3)
                board.place(.X, at: 6)

                expect(currentStatus(board)).to(equal(GameStatus.PlayerOneWins))
            }

            it("has player two for a winner in a diagonal") {
                board.place(.O, at: 0)
                board.place(.O, at: 4)
                board.place(.O, at: 8)

                expect(currentStatus(board)).to(equal(GameStatus.PlayerTwoWins))
            }
        }
    }

}