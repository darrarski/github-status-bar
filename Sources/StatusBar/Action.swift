import Foundation

public enum Action: Equatable {
    case openNotification(id: String)
    case refresh
    case quit
}
