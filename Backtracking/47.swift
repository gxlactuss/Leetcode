class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var count = [Int: Int]()
        for num in nums { count[num, default: 0] += 1 }
        var result = [[Int]]()
        var perm = [Int]()
        func dfs() {
            if perm.count == nums.count {
                result.append(perm)
                return
            }
            for (num, c) in count where c > 0 {
                count[num] = c - 1
                perm.append(num)
                dfs()
                perm.removeLast()
                count[num] = c
            }
        }
        dfs()
        return result
    }
}
