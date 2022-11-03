import Foundation

public class AddToDoUseCase {
    public init() { }
    public func excute(title: String, content: String, date: String, userType: UserType) {
        TodoTask.shared.writeTodo(
            todo: .init(
                title: title,
                content: content,
                date: date,
                userType: userType
            ))
    }
}
