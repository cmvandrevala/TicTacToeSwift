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

            it("can keep track of multiple moves") {
                let board = Board()
                board.place(.X, at: 3)
                board.place(.O, at: 2)

                expect(board.tokenAt(3)).to(equal(PlayerToken.X))
            }

            it("starts with each position empty") {
                let board = Board()

                expect(board.tokenAt(3)).to(equal(PlayerToken.Empty))
            }

            it("can clear a position") {
                let board = Board()
                board.place(.X, at: 3)
                board.place(.Empty, at: 3)

                expect(board.tokenAt(3)).to(equal(PlayerToken.Empty))
            }
        }

        describe("Whether or not the board is full") {
            it("is full when all spaces are taken") {
                let board = Board()
                for position in 0...8 {
                    board.place(.X, at: position)
                }

                expect(board.isFull()).to(beTrue())
            }

            it("does not include empty spaces") {
                let board = Board()
                for position in 0...8 {
                    board.place(.X, at: position)
                }
                board.place(.Empty, at: 4)

                expect(board.isFull()).to(beFalse())
            }
        }

        describe("The board rows") {
            var board: Board!

            beforeEach() {
                board = Board()
            }

            it("has three") {
                expect(board.rows().count).to(equal(3))
            }

            it("includes the first row") {
                board.place(.X, at: 0)
                board.place(.X, at: 1)
                board.place(.X, at: 2)

                let row = board.rows()[0]
                expect(row).to(equal([.X, .X, .X]))
            }

            it("includes the second row") {
                board.place(.X, at: 3)
                board.place(.O, at: 4)
                board.place(.X, at: 5)

                let row = board.rows()[1]
                expect(row).to(equal([.X, .O, .X]))
            }

            it("includes the third row") {
                board.place(.O, at: 6)
                board.place(.X, at: 7)
                board.place(.O, at: 8)

                let row = board.rows()[2]
                expect(row).to(equal([.O, .X, .O]))
            }
        }

        describe("The board cols") {
            var board: Board!

            beforeEach() {
                board = Board()
            }

            it("has three") {
                expect(board.cols().count).to(equal(3))
            }

            it("includes the first col") {
                board.place(.X, at: 0)
                board.place(.X, at: 3)
                board.place(.X, at: 6)

                let col = board.cols()[0]
                expect(col).to(equal([.X, .X, .X]))
            }

            it("includes the second col") {
                board.place(.X, at: 1)
                board.place(.O, at: 4)
                board.place(.X, at: 7)

                let col = board.cols()[1]
                expect(col).to(equal([.X, .O, .X]))
            }

            it("includes the third col") {
                board.place(.O, at: 2)
                board.place(.X, at: 5)
                board.place(.O, at: 8)

                let col = board.cols()[2]
                expect(col).to(equal([.O, .X, .O]))
            }
        }

        describe("The board diagonals") {
            var board: Board!

            beforeEach() {
                board = Board()
            }

            it("has two") {
                expect(board.diagonals().count).to(equal(2))
            }

            it("includes the first diagonal") {
                board.place(.X, at: 0)
                board.place(.X, at: 4)
                board.place(.X, at: 8)

                let diagonal = board.diagonals()[0]
                expect(diagonal).to(equal([.X, .X, .X]))
            }

            it("includes the second diagonal") {
                board.place(.X, at: 2)
                board.place(.O, at: 4)
                board.place(.X, at: 6)

                let diagonal = board.diagonals()[1]
                expect(diagonal).to(equal([.X, .O, .X]))
            }
        }

    }
    
}
