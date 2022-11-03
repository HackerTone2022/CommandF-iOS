import Foundation

public class ProfileTask {
    let userDefaults = UserDefaults.shared
    public let shared = ProfileTask()

    public func fetchProfile(id: String) -> User? {
        return userDefaults.object(forKey: id) as? User
    }
    public func postImage(_ id: String, _ image: Data) {
        let user = fetchProfile(id: id)
        let newUser = User(
            profileImage: image,
            name: user?.name ?? "",
            team: user?.team ?? "",
            id: user?.id ?? "",
            password: user?.password ?? "",
            state: user?.state ?? .notAttendance,
            startAt: user?.startAt,
            dateAt: user?.dateAt
        )
        self.userDefaults.set(newUser, forKey: id)
    }
}
