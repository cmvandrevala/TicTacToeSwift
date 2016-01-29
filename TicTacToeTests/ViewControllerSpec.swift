import TicTacToe
import Quick
import Nimble

class MockGameRunner: GameRunner {

    var view: GameView
    var wasTakeTurnCalled = false
    var givenPosition: Int?

    init() {
        view = MockGameView()
    }

    func takeTurn(position: Int) {
        wasTakeTurnCalled = true
        givenPosition = position
    }

}
class ViewControllerSpec: QuickSpec {
    override func setUp() {
        continueAfterFailure = false
    }
    override func spec() {

        describe("Loading the view") {
            it("initializes the game runner") {
                let controller = ViewController()

                controller.viewDidLoad()

                let runner = controller.gameRunner
                expect(runner).notTo(beNil())
                expect(runner?.view).notTo(beNil())
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

        describe("When a position is taken") {

            it("updates the button's text for X") {
                let buttonOne = UIButton()
                buttonOne.tag = 1
                let controller = ViewController()
                controller.positionButtons = [buttonOne]

                controller.positionWasTaken(position: 1, token: .X)

                expect(buttonOne.titleForState(.Normal)).to(equal("X"))
            }

            it("updates a different button's text for O") {
                let buttonOne = UIButton()
                buttonOne.tag = 1
                let buttonTwo = UIButton()
                buttonTwo.tag = 2
                let controller = ViewController()
                controller.positionButtons = [
                    buttonOne,
                    buttonTwo
                ]

                controller.positionWasTaken(position: 2, token: .O)

                expect(buttonTwo.titleForState(.Normal)).to(equal("O"))
            }

            it("disables the button") {
                let buttonOne = UIButton()
                buttonOne.tag = 1
                let controller = ViewController()
                controller.positionButtons = [buttonOne]

                controller.positionWasTaken(position: 1, token: .X)

                expect(buttonOne.enabled).to(beFalse())
            }

        }

    }
}
