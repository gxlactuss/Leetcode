class Solution {
    func removeSubfolders(_ folder: [String]) -> [String] {
        var result = [String]()
        for path in folder.sorted() {
            if let last = result.last, path.hasPrefix(last + "/") { continue }
            result.append(path)
        }
        return result
    }
}
