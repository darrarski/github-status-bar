import App
import Cocoa
import ComposableArchitecture
import GitHub

guard let username = ProcessInfo.processInfo.environment["GITHUB_USERNAME"] else {
    fatalError("Missing environment variable: GITHUB_USERNAME")
}
guard let accessToken = ProcessInfo.processInfo.environment["GITHUB_TOKEN"] else {
    fatalError("Missing environment variable: GITHUB_TOKEN")
}

let app: NSApplication = .shared
let appView: View = .init(store: .init(
    initialState: .init(),
    reducer: reducer,
    environment: .init(
        auth: .init(
            username: username,
            accessToken: accessToken
        ),
        notificationsEndpoint: Notifications.urlEndpoint(),
        urlOpener: { NSWorkspace.shared.open($0) },
        appTerminator: app.terminate(_:),
        mainQueue: AnyScheduler(DispatchQueue.main)
    )
))

app.delegate = appView
app.run()
