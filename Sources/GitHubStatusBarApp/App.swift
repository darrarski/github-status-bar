import ComposableArchitecture

struct AppState: Equatable {
    var status: String
}

enum AppAction {}

struct AppEnv {}

typealias AppReducer = Reducer<AppState, AppAction, AppEnv>

let appReducer = AppReducer.empty
