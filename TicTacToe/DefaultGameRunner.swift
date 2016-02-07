public class DefaultGameRunner: GameRunner {

    var board: Board
    let rules = StandardRules()
    var currentToken: PlayerToken
    public var view: GameView

    public init(view: GameView) {
        self.view = view
        board = Board()
        currentToken = .X
    }

    public func takeTurn(position: Int) {
        makeMove(position)
        updateStatus()
    }

    public func tokenAt(position: Int) -> PlayerToken {
        return board.tokenAt(position)
    }

    public func resetGame() {
        board = Board()
        currentToken = .X
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
