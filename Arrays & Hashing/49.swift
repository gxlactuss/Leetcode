class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        Array(Dictionary(grouping: strs) { String($0.sorted()) }.values)
    }
}
