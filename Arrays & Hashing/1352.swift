class ProductOfNumbers {
    private var products = [1]

    func add(_ num: Int) {
        if num == 0 {
            products = [1]
        } else {
            products.append(products[products.count - 1] * num)
        }
    }

    func getProduct(_ k: Int) -> Int {
        if k >= products.count { return 0 }
        return products[products.count - 1] / products[products.count - 1 - k]
    }
}
