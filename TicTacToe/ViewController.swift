import UIKit

public class ViewController: UIViewController, GameView {

    public var gameRunner: GameRunner?

    @IBOutlet public var positionButtons: [UIButton]!

    override public func viewDidLoad() {
        super.viewDidLoad()
        gameRunner = DefaultGameRunner(
            view: self
        )
    }

    @IBAction public func takeTurn(sender: AnyObject) {
        gameRunner?.takeTurn(sender.tag)
    }

    public func positionWasTaken(position position: Int, token: PlayerToken) {
        if let button = buttonAt(position) {
            button.enabled = false
            button.setTitle(buttonText(token), forState: .Normal)
        }
    }

    public func gameEndedInWin(token token: PlayerToken) {
        print("gameEndedInWin: \(token)")
    }

    public func gameEndedInDraw() {
        print("gameEndedInDraw")
    }

    private func buttonAt(position: Int) -> UIButton? {
        let matchingButtons = positionButtons.filter {(button: UIButton) in
            button.tag == position
        }
        return matchingButtons.first
    }

    private func buttonText(token: PlayerToken) -> String {
        if token == .X {
            return "X"
        } else {
            return "O"
        }
    }

}
