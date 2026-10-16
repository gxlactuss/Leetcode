class MyCalendarTwo {
    private var bookings = [(start: Int, end: Int)]()
    private var overlaps = [(start: Int, end: Int)]()

    init() {}

    func book(_ startTime: Int, _ endTime: Int) -> Bool {
        for overlap in overlaps where startTime < overlap.end && overlap.start < endTime {
            return false
        }
        for booking in bookings where startTime < booking.end && booking.start < endTime {
            overlaps.append((max(startTime, booking.start), min(endTime, booking.end)))
        }
        bookings.append((startTime, endTime))
        return true
    }
}
