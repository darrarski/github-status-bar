import Cocoa
import ComposableArchitecture
import GitHubStatusBarApp

let nsApp = NSApplication.shared

let app = App(store: Store(
    initialState: AppState(),
    reducer: appReducer,
    environment: AppEnv(
        appTerminator: nsApp.terminate(_:)
    )
))

nsApp.delegate = app
nsApp.run()
