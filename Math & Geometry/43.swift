class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" { return "0" }
        let a = num1.map { $0.wholeNumberValue! }
        let b = num2.map { $0.wholeNumberValue! }
        var result = [Int](repeating: 0, count: a.count + b.count)
        for i in a.indices.reversed() {
            for j in b.indices.reversed() {
                let sum = result[i + j + 1] + a[i] * b[j]
                result[i + j + 1] = sum % 10
                result[i + j] += sum / 10
            }
        }
        return result.drop { $0 == 0 }.map(String.init).joined()
    }
}
