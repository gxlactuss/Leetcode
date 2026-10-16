class Solution {
    func sortPeople(_ names: [String], _ heights: [Int]) -> [String] {
        zip(names, heights).sorted { $0.1 > $1.1 }.map { $0.0 }
    }
}
