class Solution {
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        if hand.count % groupSize != 0 { return false }
        var count = [Int: Int]()
        for card in hand { count[card, default: 0] += 1 }
        for card in count.keys.sorted() {
            let needed = count[card]!
            if needed == 0 { continue }
            for next in card..<(card + groupSize) {
                if count[next, default: 0] < needed { return false }
                count[next]! -= needed
            }
        }
        return true
    }
}
