import TicTacToe
import Quick
import Nimble

class FullGamesSpec: QuickSpec {
    override func spec() {

        describe("Playing full games") {

            it("starts in progress") {
                let game = Game()

                expect(game.currentStatus()).to(equal(GameStatus.InProgress))
            }

            it("ends in a draw") {
                // O | X | X
                // X | X | O
                // O | O | X
                let game = Game()

                game.makeMove(4)
                game.makeMove(0)
                game.makeMove(3)
                game.makeMove(5)
                game.makeMove(1)
                game.makeMove(7)
                game.makeMove(2)
                game.makeMove(6)
                game.makeMove(8)

                expect(game.currentStatus()).to(equal(GameStatus.Draw))
            }

            it("ends with X winning") {
                // X | X | X
                // O | O | _
                // _ | _ | _
                let game = Game()

                game.makeMove(0)
                game.makeMove(3)
                game.makeMove(1)
                game.makeMove(4)
                game.makeMove(2)

                expect(game.currentStatus()).to(equal(GameStatus.PlayerOneWins))
            }

            it("ends with O winning in a row") {
                // X | X | _
                // O | O | O
                // _ | _ | X
                let game = Game()

                game.makeMove(0)
                game.makeMove(3)
                game.makeMove(1)
                game.makeMove(4)
                game.makeMove(8)
                game.makeMove(5)

                expect(game.currentStatus()).to(equal(GameStatus.PlayerTwoWins))
            }

            it("ends with X winning in a diagonal") {
                // O | O | X
                // _ | X | _
                // X | _ | _
                let game = Game()

                game.makeMove(4)
                game.makeMove(0)
                game.makeMove(6)
                game.makeMove(1)
                game.makeMove(2)

                expect(game.currentStatus()).to(equal(GameStatus.PlayerOneWins))
            }

        }
    }
}
