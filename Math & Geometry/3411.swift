class Solution {
    func maxLength(_ nums: [Int]) -> Int {
        func gcd(_ a: Int, _ b: Int) -> Int { b == 0 ? a : gcd(b, a % b) }
        var best = 0
        for i in 0..<nums.count {
            var prod = 1, g = 0, l = 1
            for j in i..<nums.count {
                prod *= nums[j]
                g = gcd(g, nums[j])
                l = l / gcd(l, nums[j]) * nums[j]
                if prod > 25200 { break }
                if prod == l * g { best = max(best, j - i + 1) }
            }
        }
        return best
    }
}
