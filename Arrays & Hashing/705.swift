class MyHashSet {
    private var set = [Bool](repeating: false, count: 1_000_001)

    init() {}

    func add(_ key: Int) {
        set[key] = true
    }

    func remove(_ key: Int) {
        set[key] = false
    }

    func contains(_ key: Int) -> Bool {
        set[key]
    }
}
