public class DefaultGameRunner: GameRunner {

    let board: Board
    let rules: Rules
    var currentToken: PlayerToken
    public var view: GameView

    public init(view: GameView) {
        board = Board()
        rules = StandardRules()
        currentToken = .X
        self.view = view
    }

    public func takeTurn(position: Int) {
        makeMove(position)
        updateStatus()
    }

    public func tokenAt(position: Int) -> PlayerToken {
        return board.tokenAt(position)
    }

    private func makeMove(position:Int) {
        board.place(currentToken, at: position)
        view.positionWasTaken(
            position: position,
            token: currentToken
        )
    }

    private func updateStatus() {
        switch rules.determineStatus(board) {
        case .PlayerOneWins, .PlayerTwoWins:
            view.gameEndedInWin(token: currentToken)
        case .Draw:
            view.gameEndedInDraw()
        default:
            swapPlayerToken()
        }
    }

    private func swapPlayerToken() {
        if currentToken == .X {
            currentToken = .O
        } else {
            currentToken = .X
        }
    }

}
