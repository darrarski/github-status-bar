import ComposableArchitecture

public struct AppState: Equatable {
    public init(status: String = "GitHub") {
        self.status = status
    }

    public var status: String
}

public enum AppAction {}

public struct AppEnv {
    public init() {}
}

public typealias AppReducer = Reducer<AppState, AppAction, AppEnv>

public let appReducer = AppReducer.empty
