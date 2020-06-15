import ComposableArchitecture

public typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environemnt>

public let reducer = Reducer { state, action, env in
    switch action {
    case .didSelectRefresh:
        return .none
    case .didSelectQuit:
        env.appTerminator(nil)
        return .none
    }
}
