class Codec {
    func encode(_ strs: [String]) -> String {
        strs.map { "\($0.count)#\($0)" }.joined()
    }

    func decode(_ s: String) -> [String] {
        let chars = Array(s)
        var result = [String]()
        var i = 0
        while i < chars.count {
            var j = i
            while chars[j] != "#" { j += 1 }
            let length = Int(String(chars[i..<j]))!
            result.append(String(chars[(j + 1)..<(j + 1 + length)]))
            i = j + 1 + length
        }
        return result
    }
}
