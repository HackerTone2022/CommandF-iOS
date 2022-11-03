import Foundation

public class AttendanceUseCase {
    public init() { }

    public func excute(state: State) {
        UserTimeTask.shared.attendance(state)
    }
}
