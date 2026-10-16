class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack = [Int]()
        for asteroid in asteroids {
            var alive = true
            while alive, asteroid < 0, let top = stack.last, top > 0 {
                if top <= -asteroid { stack.removeLast() }
                if top >= -asteroid { alive = false }
            }
            if alive { stack.append(asteroid) }
        }
        return stack
    }
}
