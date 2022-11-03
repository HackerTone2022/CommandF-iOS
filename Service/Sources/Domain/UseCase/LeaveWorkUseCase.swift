import Foundation

public class LeaveWorkUseCase {
    public init() { }

    public func excute() {
        UserTimeTask.shared.leaveHome()
    }
}
