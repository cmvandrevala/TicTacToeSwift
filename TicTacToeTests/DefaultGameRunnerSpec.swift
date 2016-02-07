import TicTacToe
import Quick
import Nimble

class MockGameView: GameView {

    var positionWasTakenCalled = false
    var takenPosition: Int?
    var token: PlayerToken?
    var wasToldGameEndedInWin = false
    var givenWinner: PlayerToken?
    var wasToldGameEndedInDraw = false

    func positionWasTaken(position position: Int, token: PlayerToken) {
        positionWasTakenCalled = true
        takenPosition = position
        self.token = token
    }

    func gameEndedInWin(token token: PlayerToken) {
        wasToldGameEndedInWin = true
        givenWinner = token
    }

    func gameEndedInDraw() {
        wasToldGameEndedInDraw = true
    }

}
class DefaultGameRunnerSpec: QuickSpec {

    override func setUp() {
        continueAfterFailure = false
    }
    
    override func spec() {

        describe("Taking a turn") {

            it("makes the given move") {
                let runner = DefaultGameRunner(view: MockGameView())

                runner.takeTurn(4)

                expect(runner.tokenAt(4)).to(equal(PlayerToken.X))
            }

            it("takes the second turn") {
                let runner = DefaultGameRunner(view: MockGameView())
                runner.takeTurn(4)

                runner.takeTurn(5)

                expect(runner.tokenAt(5)).to(equal(PlayerToken.O))
            }

            it("lets the view know that a position was taken") {
                let view = MockGameView()
                let runner = DefaultGameRunner(
                    view: view
                )

                runner.takeTurn(5)

                expect(view.positionWasTakenCalled).to(beTrue())
                expect(view.takenPosition).to(equal(5))
                expect(view.token).to(equal(PlayerToken.X))
            }

            it("lets the view know that the game ended with X winning") {
                let view = MockGameView()
                let runner = DefaultGameRunner(
                    view: view
                )

                runner.takeTurn(0)
                runner.takeTurn(3)
                runner.takeTurn(1)
                runner.takeTurn(4)
                runner.takeTurn(2)

                expect(view.wasToldGameEndedInWin).to(beTrue())
                expect(view.givenWinner).to(equal(PlayerToken.X))
            }

            it("lets the view know that the game ended with O winning") {
                let view = MockGameView()
                let runner = DefaultGameRunner(
                    view: view
                )

                runner.takeTurn(0)
                runner.takeTurn(3)
                runner.takeTurn(1)
                runner.takeTurn(4)
                runner.takeTurn(7)
                runner.takeTurn(5)

                expect(view.wasToldGameEndedInWin).to(beTrue())
                expect(view.givenWinner).to(equal(PlayerToken.O))
            }

            it("lets the view know that the game ended in a draw") {
                let view = MockGameView()
                let runner = DefaultGameRunner(
                    view: view
                )

                runner.takeTurn(4)
                runner.takeTurn(0)
                runner.takeTurn(3)
                runner.takeTurn(5)
                runner.takeTurn(1)
                runner.takeTurn(7)
                runner.takeTurn(2)
                runner.takeTurn(6)
                runner.takeTurn(8)

                expect(view.wasToldGameEndedInDraw).to(beTrue())
            }

        }

        describe("Resetting the game") {

            it("clears the board") {
                let runner = DefaultGameRunner(view: MockGameView())
                runner.takeTurn(4)

                runner.resetGame()

                expect(runner.tokenAt(4)).to(equal(PlayerToken.Empty))
            }

            it("makes it X's turn") {
                let runner = DefaultGameRunner(view: MockGameView())
                runner.takeTurn(4)

                runner.resetGame()
                runner.takeTurn(5)

                expect(runner.tokenAt(5)).to(equal(PlayerToken.X))
            }

        }

    }

}
