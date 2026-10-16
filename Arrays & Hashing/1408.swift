class Solution {
    func stringMatching(_ words: [String]) -> [String] {
        words.filter { word in
            words.contains { $0 != word && $0.contains(word) }
        }
    }
}
