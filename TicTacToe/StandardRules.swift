public class StandardRules: Rules {

    public init() {}
    
    public func determineStatus(board: Board) -> GameStatus {
        if (hasWinner(board, playerToken: .X)) {
            return .PlayerOneWins
        } else if (hasWinner(board, playerToken: .O)) {
            return .PlayerTwoWins
        } else if (board.isFull()) {
            return .Draw
        } else {
            return .InProgress
        }
    }

    private func hasWinner(board: Board, playerToken: PlayerToken) -> Bool{
        return winningCombinations(board, playerToken: playerToken).count > 0
    }

    private func winningCombinations(board: Board, playerToken: PlayerToken) -> [[PlayerToken]] {
        let potentialWinningCombinations = board.rows() + board.cols() + board.diagonals()
        return potentialWinningCombinations.filter {
            Set($0) == [playerToken]
        }
    }

}
