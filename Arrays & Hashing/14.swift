class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var prefix = strs[0]
        for s in strs.dropFirst() {
            while !s.hasPrefix(prefix) {
                prefix.removeLast()
            }
        }
        return prefix
    }
}
