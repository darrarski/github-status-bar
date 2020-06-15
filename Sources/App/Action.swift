import StatusBar
import GitHub

public enum Action: Equatable {
    case fetchNotifications
    case didFetchNotifications([Notification])
    case statusBar(StatusBar.Action)
}
