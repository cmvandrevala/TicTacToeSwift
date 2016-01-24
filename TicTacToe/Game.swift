public class Game {

    let board: Board
    var currentToken: PlayerToken
    var rules: Rules

    public init() {
        board = Board()
        rules = StandardRules()
        currentToken = .X
    }

    public init(board: Board, rules: Rules) {
        self.board = board
        self.rules = rules
        currentToken = .X
    }

    public func makeMove(position: Int) {
        board.place(currentToken, at: position)
        swapPlayerToken()
    }

    public func currentStatus() -> GameStatus {
        return rules.determineStatus(board)
    }

    private func swapPlayerToken() {
        if currentToken == .X {
            currentToken = .O
        } else {
            currentToken = .X
        }
    }

}