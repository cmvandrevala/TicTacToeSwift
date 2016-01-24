public class StandardRules: Rules {

    public func determineStatus(board: Board) -> GameStatus {
        return .InProgress
    }
}
