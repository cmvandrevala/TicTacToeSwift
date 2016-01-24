import TicTacToe

class MockRules: Rules {

    var gameStatus: GameStatus
    var givenBoard: Board?

    init() {
        gameStatus = .InProgress
    }

    func determineStatus(board: Board) -> GameStatus {
        givenBoard = board
        return gameStatus
    }

}
