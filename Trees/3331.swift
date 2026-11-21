class Solution {
    func findSubtreeSizes(_ parent: [Int], _ s: String) -> [Int] {
        let n = parent.count
        let chars = s.utf8.map { Int($0) - 97 }
        var children = [[Int]](repeating: [], count: n)
        for i in 1..<n { children[parent[i]].append(i) }

        var newParent = parent
        var last = [Int](repeating: -1, count: 26)
        var saved = [Int](repeating: -1, count: n)
        var order = [Int]()
        var stack = [(0, false)]
        while let (x, done) = stack.popLast() {
            let c = chars[x]
            if done {
                last[c] = saved[x]
                continue
            }
            if last[c] != -1 { newParent[x] = last[c] }
            saved[x] = last[c]
            last[c] = x
            order.append(x)
            stack.append((x, true))
            for child in children[x] { stack.append((child, false)) }
        }

        var size = [Int](repeating: 1, count: n)
        for x in order.reversed() where x != 0 {
            size[newParent[x]] += size[x]
        }
        return size
    }
}
