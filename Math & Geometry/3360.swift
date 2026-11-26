class Solution {
    func canAliceWin(_ n: Int) -> Bool {
        var stones = n, take = 10, alice = true
        while stones >= take {
            stones -= take
            take -= 1
            alice.toggle()
        }
        return !alice
    }
}
