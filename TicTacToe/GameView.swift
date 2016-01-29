public protocol GameView {

    func positionWasTaken(position position: Int, token: PlayerToken)

    func gameEndedInWin(token token: PlayerToken)
    func gameEndedInDraw()

}
