class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var image = image
        let original = image[sr][sc]
        if original == color { return image }
        var stack = [(sr, sc)]
        image[sr][sc] = color
        while let (r, c) = stack.popLast() {
            for (nr, nc) in [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]
            where nr >= 0 && nr < image.count && nc >= 0 && nc < image[0].count && image[nr][nc] == original {
                image[nr][nc] = color
                stack.append((nr, nc))
            }
        }
        return image
    }
}
