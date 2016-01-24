public protocol Rules {

    func determineStatus(board: Board) -> GameStatus

}
