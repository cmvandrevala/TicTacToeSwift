public class Board {

    var token: PlayerToken
    var spaces: [Int:PlayerToken]

    public init() {
        token = .X
        spaces = [:]
    }

    public func place(token: PlayerToken, at position: Int) {
        self.token = token
        spaces[position] = token
    }

    public func tokenAt(position: Int) -> PlayerToken {
        if let token = spaces[position] {
            return token
        } else {
            return .Empty
        }
    }

}
