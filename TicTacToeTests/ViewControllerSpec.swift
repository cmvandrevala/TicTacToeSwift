import TicTacToe
import Quick
import Nimble

class MockGameRunner: GameRunner {

    var wasTakeTurnCalled = false
    var givenPosition: Int?

    func takeTurn(position: Int) {
        wasTakeTurnCalled = true
        givenPosition = position
    }
}
class ViewControllerSpec: QuickSpec {
    override func spec() {

        describe("Loading the view") {
            it("initializes the game runner") {
                let controller = ViewController()

                controller.viewDidLoad()

                expect(controller.gameRunner).notTo(beNil())
            }
        }

        describe("Taking a turn") {
            it("tells the game runner to take a turn") {
                let button = UIButton()
                button.tag = 123
                let controller = ViewController()
                let runner = MockGameRunner()
                controller.gameRunner = runner

                controller.takeTurn(button)

                expect(runner.wasTakeTurnCalled).to(beTrue())
                expect(runner.givenPosition).to(equal(123))
            }
        }

    }
}
