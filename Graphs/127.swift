class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var words = Set(wordList)
        if !words.contains(endWord) { return 0 }
        var queue = [beginWord]
        var length = 1
        while !queue.isEmpty {
            var next = [String]()
            for word in queue {
                if word == endWord { return length }
                var chars = Array(word.utf8)
                for i in chars.indices {
                    let original = chars[i]
                    for c in UInt8(97)...UInt8(122) where c != original {
                        chars[i] = c
                        let candidate = String(decoding: chars, as: UTF8.self)
                        if words.remove(candidate) != nil {
                            next.append(candidate)
                        }
                    }
                    chars[i] = original
                }
            }
            queue = next
            length += 1
        }
        return 0
    }
}
