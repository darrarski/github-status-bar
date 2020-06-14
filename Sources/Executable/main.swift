import App
import Cocoa
import ComposableArchitecture
import GitHub

let app: NSApplication = .shared
let appView: View = .init(store: .init(
    initialState: .init(),
    reducer: reducer,
    environment: .init(
        notificationsEndpoint: Notifications.urlEndpoint(),
        appTerminator: app.terminate(_:),
        mainQueue: AnyScheduler(DispatchQueue.main)
    )
))

app.delegate = appView
app.run()
