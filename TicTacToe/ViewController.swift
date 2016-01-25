import UIKit

public class ViewController: UIViewController {

    public var gameRunner: GameRunner?

    override public func viewDidLoad() {
        super.viewDidLoad()
        gameRunner = DefaultGameRunner()
    }

    @IBAction public func takeTurn(sender: AnyObject) {
        gameRunner?.takeTurn(sender.tag)
    }
}
