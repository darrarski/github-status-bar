import ComposableArchitecture

public typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environemnt>

public let reducer = Reducer { state, action, env in
    switch action {
    case .refresh:
        return .none
    case .quit:
        env.appTerminator(nil)
        return .none
    }
}
