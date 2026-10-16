class TimeMap {
    private var store = [String: [(timestamp: Int, value: String)]]()

    init() {}

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        store[key, default: []].append((timestamp, value))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard let values = store[key] else { return "" }
        var l = 0
        var r = values.count - 1
        var result = ""
        while l <= r {
            let mid = (l + r) / 2
            if values[mid].timestamp <= timestamp {
                result = values[mid].value
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return result
    }
}
