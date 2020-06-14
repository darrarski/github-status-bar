import StatusBar
import GitHub

public enum Action {
    case didFinishLaunching
    case didFetchNotifications([Notification])
    case statusBar(StatusBar.Action)
}
