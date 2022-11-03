import Foundation

public class DeleteUseUseCase {
    public func excute(id: String) {
        return UserLoginTask.shared.deleteUser(id)
    }
}
