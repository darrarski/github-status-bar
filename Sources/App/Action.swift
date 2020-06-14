import StatusBar
import GitHub

public enum Action: Equatable {
    case didFinishLaunching
    case didFetchNotifications([Notification])
    case statusBar(StatusBar.Action)
}
