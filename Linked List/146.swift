class LRUCache {
    private class Node {
        let key: Int
        var value: Int
        weak var prev: Node?
        var next: Node?

        init(_ key: Int, _ value: Int) {
            self.key = key
            self.value = value
        }
    }

    private let capacity: Int
    private var nodes = [Int: Node]()
    private let head = Node(0, 0)
    private let tail = Node(0, 0)

    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }

    func get(_ key: Int) -> Int {
        guard let node = nodes[key] else { return -1 }
        remove(node)
        insertFront(node)
        return node.value
    }

    func put(_ key: Int, _ value: Int) {
        if let node = nodes[key] {
            node.value = value
            remove(node)
            insertFront(node)
            return
        }
        if nodes.count == capacity {
            let lru = tail.prev!
            remove(lru)
            nodes[lru.key] = nil
        }
        let node = Node(key, value)
        nodes[key] = node
        insertFront(node)
    }

    private func remove(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }

    private func insertFront(_ node: Node) {
        node.next = head.next
        node.prev = head
        head.next?.prev = node
        head.next = node
    }
}
