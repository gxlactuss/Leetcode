class LFUCache {
    private class Node {
        let key: Int
        var value: Int
        var freq = 1
        weak var prev: Node?
        var next: Node?

        init(_ key: Int, _ value: Int) {
            self.key = key
            self.value = value
        }
    }

    private class List {
        let head = Node(0, 0)
        let tail = Node(0, 0)
        var count = 0

        init() {
            head.next = tail
            tail.prev = head
        }

        func insertFront(_ node: Node) {
            node.next = head.next
            node.prev = head
            head.next?.prev = node
            head.next = node
            count += 1
        }

        func remove(_ node: Node) {
            node.prev?.next = node.next
            node.next?.prev = node.prev
            count -= 1
        }

        func removeLast() -> Node {
            let node = tail.prev!
            remove(node)
            return node
        }
    }

    private let capacity: Int
    private var nodes = [Int: Node]()
    private var lists = [Int: List]()
    private var minFreq = 0

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        guard let node = nodes[key] else { return -1 }
        touch(node)
        return node.value
    }

    func put(_ key: Int, _ value: Int) {
        if let node = nodes[key] {
            node.value = value
            touch(node)
            return
        }
        if nodes.count == capacity {
            let list = lists[minFreq]!
            let evicted = list.removeLast()
            if list.count == 0 { lists[minFreq] = nil }
            nodes[evicted.key] = nil
        }
        let node = Node(key, value)
        nodes[key] = node
        add(node)
        minFreq = 1
    }

    private func touch(_ node: Node) {
        let list = lists[node.freq]!
        list.remove(node)
        if list.count == 0 {
            lists[node.freq] = nil
            if minFreq == node.freq { minFreq += 1 }
        }
        node.freq += 1
        add(node)
    }

    private func add(_ node: Node) {
        let list = lists[node.freq] ?? List()
        lists[node.freq] = list
        list.insertFront(node)
    }
}
