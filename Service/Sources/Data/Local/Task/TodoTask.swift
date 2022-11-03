import Foundation

public class TodoTask {
    let userDefaults = UserDefaults.shared
    public static let shared = TodoTask()

    public func fetchTodo() -> [ToDo] {
        userDefaults.object(forKey: "todo") as? [ToDo] ?? []
    }
    public func writeTodo(todo: ToDo) {
        var todoList = fetchTodo()
        todoList.append(todo)
        userDefaults.set(todoList, forKey: "todo")
    }
}
