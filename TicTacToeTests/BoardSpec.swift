import TicTacToe
import Quick
import Nimble

class BoardSpec: QuickSpec {

    override func spec() {
        describe("Making a move") {
            it("places a mark for X") {
                let board = Board()
                board.place(.X, at: 0)
                expect(board.tokenAt(0)).to(equal(PlayerToken.X))
            }

            it("places a mark for O") {
                let board = Board()
                board.place(.O, at: 2)
                expect(board.tokenAt(2)).to(equal(PlayerToken.O))
            }
        }
    }
    
}
