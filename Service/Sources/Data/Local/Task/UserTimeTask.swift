import Foundation

public class UserTimeTask {
    let userDefaults = UserDefaults.shared
    let current = Date()
    public static let shared = UserTimeTask()

    public func attendance(_ state: State) {
        let id = UserLoginTask.shared.fetchId()
        let user = userDefaults.object(forKey: id) as? User
        let attendance = User(
            profileImage: Data(),
            name: user?.name ?? "",
            team: user?.team ?? "",
            id: user?.id ?? "",
            password: user?.password ?? "",
            state: state,
            startAt: current,
            dateAt: nil
        )
        self.userDefaults.set(attendance, forKey: id)
    }
    public func leaveHome() {
        let id = UserLoginTask.shared.fetchId()
        let user = userDefaults.object(forKey: id) as? User
        var userList = userDefaults.object(forKey: "userList") as? [User] ?? []
        let attendance = User(
            profileImage: Data(),
            name: user?.name ?? "",
            team: user?.team ?? "",
            id: user?.id ?? "",
            password: user?.password ?? "",
            state: .leaveHome,
            startAt: user?.startAt ?? Date(),
            dateAt: current
        )
        userList.append(attendance)
        self.userDefaults.set(userList, forKey: "userList")
    }
}
