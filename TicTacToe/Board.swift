public enum PlayerToken {
    case X
    case O
}
public class Board {

    var token: PlayerToken
    public init() {
        token = .X
    }

    public func place(token: PlayerToken, at: Int) {
        self.token = token
    }

    public func tokenAt(position: Int) -> PlayerToken {
        return token
    }
}
