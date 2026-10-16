class Twitter {
    private var time = 0
    private var tweets = [Int: [(time: Int, id: Int)]]()
    private var following = [Int: Set<Int>]()

    init() {}

    func postTweet(_ userId: Int, _ tweetId: Int) {
        tweets[userId, default: []].append((time, tweetId))
        time += 1
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        let users = following[userId, default: []].union([userId])
        let recent = users.flatMap { tweets[$0, default: []].suffix(10) }
        return recent.sorted { $0.time > $1.time }.prefix(10).map { $0.id }
    }

    func follow(_ followerId: Int, _ followeeId: Int) {
        following[followerId, default: []].insert(followeeId)
    }

    func unfollow(_ followerId: Int, _ followeeId: Int) {
        following[followerId]?.remove(followeeId)
    }
}
