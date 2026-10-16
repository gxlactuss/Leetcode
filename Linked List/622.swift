class MyCircularQueue {
    private var items: [Int]
    private var head = 0
    private var count = 0

    init(_ k: Int) {
        items = [Int](repeating: 0, count: k)
    }

    func enQueue(_ value: Int) -> Bool {
        if isFull() { return false }
        items[(head + count) % items.count] = value
        count += 1
        return true
    }

    func deQueue() -> Bool {
        if isEmpty() { return false }
        head = (head + 1) % items.count
        count -= 1
        return true
    }

    func Front() -> Int {
        isEmpty() ? -1 : items[head]
    }

    func Rear() -> Int {
        isEmpty() ? -1 : items[(head + count - 1) % items.count]
    }

    func isEmpty() -> Bool {
        count == 0
    }

    func isFull() -> Bool {
        count == items.count
    }
}
