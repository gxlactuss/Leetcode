class MyHashMap {
    private var map = [Int](repeating: -1, count: 1_000_001)

    init() {}

    func put(_ key: Int, _ value: Int) {
        map[key] = value
    }

    func get(_ key: Int) -> Int {
        map[key]
    }

    func remove(_ key: Int) {
        map[key] = -1
    }
}
