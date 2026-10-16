class Solution {
    func frequencySort(_ nums: [Int]) -> [Int] {
        var count = [Int: Int]()
        for num in nums { count[num, default: 0] += 1 }
        return nums.sorted {
            count[$0]! != count[$1]! ? count[$0]! < count[$1]! : $0 > $1
        }
    }
}
