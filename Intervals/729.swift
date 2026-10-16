class MyCalendar {
    private var bookings = [(start: Int, end: Int)]()

    init() {}

    func book(_ startTime: Int, _ endTime: Int) -> Bool {
        for booking in bookings where startTime < booking.end && booking.start < endTime {
            return false
        }
        bookings.append((startTime, endTime))
        return true
    }
}
