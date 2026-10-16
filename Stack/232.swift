class MyQueue {
    private var input = [Int]()
    private var output = [Int]()

    init() {}

    func push(_ x: Int) {
        input.append(x)
    }

    func pop() -> Int {
        _ = peek()
        return output.removeLast()
    }

    func peek() -> Int {
        if output.isEmpty {
            while let x = input.popLast() {
                output.append(x)
            }
        }
        return output.last!
    }

    func empty() -> Bool {
        input.isEmpty && output.isEmpty
    }
}
