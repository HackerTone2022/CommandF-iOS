import Foundation

public extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(identifier: "KST")
        formatter.dateFormat = "yyyy-MM-dd"

        return formatter.string(from: self)
    }

    func timeToString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(identifier: "KST")
        formatter.dateFormat = "hh:mm"

        return formatter.string(from: self)
    }
}
