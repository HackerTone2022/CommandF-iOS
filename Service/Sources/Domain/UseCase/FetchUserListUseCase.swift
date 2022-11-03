import Foundation

public class FetchUserListUseCase {

    public init() { }

    public func excute() -> [User] {
        return UserLoginTask.shared.fetchUserList()
    }
}
