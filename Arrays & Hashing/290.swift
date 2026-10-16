class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let words = s.split(separator: " ").map(String.init)
        guard words.count == pattern.count else { return false }
        var charToWord = [Character: String]()
        var wordToChar = [String: Character]()
        for (c, word) in zip(pattern, words) {
            if let w = charToWord[c], w != word { return false }
            if let ch = wordToChar[word], ch != c { return false }
            charToWord[c] = word
            wordToChar[word] = c
        }
        return true
    }
}
