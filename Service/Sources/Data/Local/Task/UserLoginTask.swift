import Foundation

public class UserLoginTask {
    let userDefaults = UserDefaults.shared
    public static let shared = UserLoginTask()

    init() { }

    public func addUser(_ id: String, _ password: String, _ name: String) {
        let user = User(
            profileImage: Data(),
            name: name,
            team: "insa",
            id: id,
            password: password,
            state: .notAttendance,
            startAt: nil,
            dateAt: nil
        )
        self.userDefaults.set(user, forKey: id)
        self.userDefaults.set(
            id,
            forKey: "id"
        )
        var userList = userDefaults.object(forKey: "userList") as? [User]
        userList?.append(user)
        self.userDefaults.set(userList, forKey: "userList")
    }
    public func fetchUserList() -> [User] {
        return userDefaults.object(forKey: "userList") as? [User] ?? []
    }
    public func fetchId() -> String {
        return self.userDefaults.string(forKey: "id") ?? ""
    }
    public func userLogin(_ id: String, _ password: String) -> Bool {
        guard let user = userDefaults.object(forKey: id) as? User else { return false }
        if user.password == password {
            return true
        }
        return false
    }
    public func adminLogin(_ id: String, _ password: String) -> Bool {
        guard let user = userDefaults.object(forKey: id) as? User else { return false }
        if user.password == password {
            return true
        }
        return false
    }
    public func deleteUser(_ id: String) {
        let user = userDefaults.object(forKey: id) as? User
        self.userDefaults.set(nil, forKey: id)
        let userList = fetchUserList()
        userDefaults.set(userList.filter { $0.name != user?.name }, forKey: "userList")
    }
}
