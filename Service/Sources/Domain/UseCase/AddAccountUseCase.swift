import Foundation

public class AddAccountUseCase {

    public init() { }
    public func excute(id: String, password: String, name: String) {
        return UserLoginTask.shared.addUser(id, password, name)
    }
}
