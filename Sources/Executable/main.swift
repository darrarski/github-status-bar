import App
import Cocoa
import ComposableArchitecture

let app: NSApplication = .shared
let appView: App.View = .init(store: .init(
    initialState: .init(),
    reducer: reducer,
    environment: .init(
        appTerminator: app.terminate(_:)
    )
))

app.delegate = appView
app.run()
