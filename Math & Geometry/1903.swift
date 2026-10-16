class Solution {
    func largestOddNumber(_ num: String) -> String {
        guard let last = num.lastIndex(where: { $0.wholeNumberValue! % 2 == 1 }) else { return "" }
        return String(num[...last])
    }
}
