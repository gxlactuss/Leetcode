class Solution {
    func findDifferentBinaryString(_ nums: [String]) -> String {
        String(nums.enumerated().map { i, num in
            Array(num)[i] == "0" ? Character("1") : Character("0")
        })
    }
}
