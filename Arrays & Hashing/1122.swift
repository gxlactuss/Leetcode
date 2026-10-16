class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        let rank = Dictionary(uniqueKeysWithValues: arr2.enumerated().map { ($1, $0) })
        return arr1.sorted { (rank[$0] ?? 1000 + $0) < (rank[$1] ?? 1000 + $1) }
    }
}
