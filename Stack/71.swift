class Solution {
    func simplifyPath(_ path: String) -> String {
        var stack = [Substring]()
        for part in path.split(separator: "/") {
            if part == ".." {
                _ = stack.popLast()
            } else if part != "." {
                stack.append(part)
            }
        }
        return "/" + stack.joined(separator: "/")
    }
}
