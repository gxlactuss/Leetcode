class Codec {
    private var urls = [String: String]()

    func encode(_ longUrl: String) -> String {
        let shortUrl = "http://tinyurl.com/\(urls.count)"
        urls[shortUrl] = longUrl
        return shortUrl
    }

    func decode(_ shortUrl: String) -> String {
        urls[shortUrl]!
    }
}
