import Cocoa
import ComposableArchitecture
import GitHubStatusBarApp

let app = NSApplication.shared
let store = Store(initialState: AppState(), reducer: appReducer, environment: AppEnv())
let appDelegate = AppDelegate(store: store)
app.delegate = appDelegate
app.run()
