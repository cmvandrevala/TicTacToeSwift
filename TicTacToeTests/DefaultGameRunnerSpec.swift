import TicTacToe
import Quick
import Nimble

class DefaultGameRunnerSpec: QuickSpec {

    override func spec() {

        describe("DefaultGameRunner") {

            it("exists") {
                let runner = DefaultGameRunner()
                expect(runner).notTo(beNil())
            }

        }

    }

}
