public protocol GameRunner {

    var view: GameView { get }

    func takeTurn(position: Int)

}
