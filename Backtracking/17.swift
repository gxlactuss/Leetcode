class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        let letters: [Character: String] = [
            "2": "abc", "3": "def", "4": "ghi", "5": "jkl",
            "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz",
        ]
        var result = [""]
        for digit in digits {
            result = result.flatMap { prefix in letters[digit]!.map { prefix + String($0) } }
        }
        return result
    }
}
