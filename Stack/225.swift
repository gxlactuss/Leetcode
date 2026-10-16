class MyStack {
    private var queue = [Int]()

    init() {}

    func push(_ x: Int) {
        queue.append(x)
        for _ in 0..<(queue.count - 1) {
            queue.append(queue.removeFirst())
        }
    }

    func pop() -> Int {
        queue.removeFirst()
    }

    func top() -> Int {
        queue.first!
    }

    func empty() -> Bool {
        queue.isEmpty
    }
}
