class Solution {
    func vowelStrings(_ words: [String], _ queries: [[Int]]) -> [Int] {
        let vowels = Set("aeiou")
        var prefix = [0]
        for word in words {
            let valid = vowels.contains(word.first!) && vowels.contains(word.last!)
            prefix.append(prefix.last! + (valid ? 1 : 0))
        }
        return queries.map { prefix[$0[1] + 1] - prefix[$0[0]] }
    }
}
