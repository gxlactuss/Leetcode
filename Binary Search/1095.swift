class Solution {
    func findInMountainArray(_ target: Int, _ mountainArr: MountainArray) -> Int {
        let n = mountainArr.length()
        var l = 1
        var r = n - 2
        while l < r {
            let mid = (l + r) / 2
            if mountainArr.get(mid) < mountainArr.get(mid + 1) {
                l = mid + 1
            } else {
                r = mid
            }
        }
        let peak = l

        func search(_ low: Int, _ high: Int, _ ascending: Bool) -> Int {
            var l = low
            var r = high
            while l <= r {
                let mid = (l + r) / 2
                let value = mountainArr.get(mid)
                if value == target { return mid }
                if (value < target) == ascending {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            return -1
        }

        let left = search(0, peak, true)
        return left != -1 ? left : search(peak + 1, n - 1, false)
    }
}
