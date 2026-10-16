class MinStack {
    private var stack = [(value: Int, min: Int)]()

    init() {}

    func push(_ val: Int) {
        stack.append((val, min(val, stack.last?.min ?? val)))
    }

    func pop() {
        stack.removeLast()
    }

    func top() -> Int {
        stack.last!.value
    }

    func getMin() -> Int {
        stack.last!.min
    }
}
