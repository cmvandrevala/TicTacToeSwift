public class Board {

    var spaces: [Int:PlayerToken]

    public init() {
        spaces = [:]
    }

    public func place(token: PlayerToken, at position: Int) {
        spaces[position] = token
    }

    public func tokenAt(position: Int) -> PlayerToken {
        if let token = spaces[position] {
            return token
        } else {
            return .Empty
        }
    }

    public func isFull() -> Bool {
        return filledSpaces().count == 9
    }

    public func rows() -> [[PlayerToken]] {
        return [tokensAt(0, 1, 2)]
    }

    public func cols() -> [[PlayerToken]] {
        return [tokensAt(0, 3, 6)]
    }

    public func diagonals() -> [[PlayerToken]] {
        return [tokensAt(0, 4, 8)]

    }

    private func filledSpaces() -> [PlayerToken] {
        return spaces.values.filter({ (token: PlayerToken) in
            token != .Empty
        })
    }

    private func tokensAt(positions: Int...) -> [PlayerToken] {
        return positions.map { (position: Int) in
            tokenAt(position)
        }
    }

}
