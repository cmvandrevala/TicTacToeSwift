import WatchKit
import Foundation

class GameInterfaceController: WKInterfaceController, GameView {

    var gameRunner: GameRunner?
    var buttons: [WKInterfaceButton] = []

    @IBOutlet var gamePrompt: WKInterfaceLabel!

    @IBOutlet var buttonZero: WKInterfaceButton!
    @IBOutlet var buttonOne: WKInterfaceButton!
    @IBOutlet var buttonTwo: WKInterfaceButton!
    @IBOutlet var buttonThree: WKInterfaceButton!
    @IBOutlet var buttonFour: WKInterfaceButton!
    @IBOutlet var buttonFive: WKInterfaceButton!
    @IBOutlet var buttonSix: WKInterfaceButton!
    @IBOutlet var buttonSeven: WKInterfaceButton!
    @IBOutlet var buttonEight: WKInterfaceButton!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        buttons = [
            buttonZero,
            buttonOne,
            buttonTwo,
            buttonThree,
            buttonFour,
            buttonFive,
            buttonSix,
            buttonSeven,
            buttonEight
        ]
        gameRunner = DefaultGameRunner(view: self)
    }

    func positionWasTaken(position position: Int, token: PlayerToken) {
        let button = buttons[position]
        button.setTitle("\(token)")
        button.setEnabled(false)
    }

    func gameEndedInWin(token token: PlayerToken) {
        gamePrompt.setText("\(token) Wins!")
    }

    func gameEndedInDraw() {
        gamePrompt.setText("Draw!")
    }

    @IBAction func moveZero() {
        gameRunner?.takeTurn(0)
    }

    @IBAction func moveOne() {
        gameRunner?.takeTurn(1)
    }

    @IBAction func moveTwo() {
        gameRunner?.takeTurn(2)
    }

    @IBAction func moveThree() {
        gameRunner?.takeTurn(3)
    }

    @IBAction func moveFour() {
        gameRunner?.takeTurn(4)
    }

    @IBAction func moveFive() {
        gameRunner?.takeTurn(5)
    }

    @IBAction func moveSix() {
        gameRunner?.takeTurn(6)
    }

    @IBAction func moveSeven() {
        gameRunner?.takeTurn(7)
    }

    @IBAction func moveEight() {
        gameRunner?.takeTurn(8)
    }

}
