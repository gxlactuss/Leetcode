class NumArray {
    private var prefix = [0]

    init(_ nums: [Int]) {
        for num in nums {
            prefix.append(prefix.last! + num)
        }
    }

    func sumRange(_ left: Int, _ right: Int) -> Int {
        prefix[right + 1] - prefix[left]
    }
}
