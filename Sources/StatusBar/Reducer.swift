import ComposableArchitecture

public typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environemnt>

public let reducer = Reducer { state, action, env in
    switch action {
    case .openNotification(let id):
        // TODO: get URL from notification with given ID and open it
        // env.urlOpener(url)
        return .none
    case .refresh:
        return .none
    case .quit:
        env.appTerminator(nil)
        return .none
    }
}
