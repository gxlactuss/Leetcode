class Solution {
    func maxTurbulenceSize(_ arr: [Int]) -> Int {
        var up = 1
        var down = 1
        var best = 1
        for i in 1..<arr.count {
            if arr[i] > arr[i - 1] {
                up = down + 1
                down = 1
            } else if arr[i] < arr[i - 1] {
                down = up + 1
                up = 1
            } else {
                up = 1
                down = 1
            }
            best = max(best, up, down)
        }
        return best
    }
}
