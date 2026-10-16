class Solution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        Set(emails.map { email -> String in
            let parts = email.split(separator: "@")
            let local = parts[0].prefix { $0 != "+" }.filter { $0 != "." }
            return local + "@" + parts[1]
        }).count
    }
}
