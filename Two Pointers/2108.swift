class Solution {
    func firstPalindrome(_ words: [String]) -> String {
        words.first { $0 == String($0.reversed()) } ?? ""
    }
}
