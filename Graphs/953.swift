class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        let rank = Dictionary(uniqueKeysWithValues: order.enumerated().map { ($1, $0) })
        let keys = words.map { $0.map { rank[$0]! } }
        return zip(keys, keys.dropFirst()).allSatisfy { !$1.lexicographicallyPrecedes($0) }
    }
}
