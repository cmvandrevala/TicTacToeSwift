public class Game {

    let board: Board
    var currentToken: PlayerToken

    public init() {
        board = Board()
        currentToken = .X
    }

    public init(board: Board) {
        self.board = board
        currentToken = .X
    }

    public func makeMove(position: Int) {
        board.place(currentToken, at: position)
        swapPlayerToken()
    }

    public func currentStatus() -> GameStatus {
        return .InProgress
    }

    private func swapPlayerToken() {
        if currentToken == .X {
            currentToken = .O
        } else {
            currentToken = .X
        }
    }

}