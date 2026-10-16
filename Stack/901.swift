class StockSpanner {
    private var stack = [(price: Int, span: Int)]()

    init() {}

    func next(_ price: Int) -> Int {
        var span = 1
        while let top = stack.last, top.price <= price {
            span += top.span
            stack.removeLast()
        }
        stack.append((price, span))
        return span
    }
}
