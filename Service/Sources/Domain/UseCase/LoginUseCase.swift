import Foundation

import RxSwift

public class LoginUseCase {

    public init() { }

    public func excute(id: String, password: String) -> Bool {
        return UserLoginTask.shared.userLogin(id, password)
    }
}
