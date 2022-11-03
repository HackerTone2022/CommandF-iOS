import Foundation

public struct User: Equatable {
    public let profileImage: Data
    public let name: String
    public let team: String
    public let id: String
    public let password: String
    public let state: State
    public let startAt: Date?
    public let dateAt: Date?
}
