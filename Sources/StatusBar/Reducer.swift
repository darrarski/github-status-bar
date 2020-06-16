import ComposableArchitecture
import Foundation
import GitHub

public typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environemnt>

public let reducer = Reducer { state, action, env in
    switch action {
    case .openNotification(let id):
        return .fireAndForget { [state] in
            if let url = state.notifications.first(where: { $0.id == id })?.webURL {
                env.urlOpener(url)
            }
        }
    case .refresh:
        return .none
    case .quit:
        return .fireAndForget {
            env.appTerminator(nil)
        }
    }
}
