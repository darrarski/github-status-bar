import Combine
import ComposableArchitecture
import GitHub
import StatusBar

public typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environment>

public let reducer = Reducer.combine(
    Reducer { state, action, env in
        switch action {
        case .fetchNotifications,
             .statusBar(.refresh):
            return env.notificationsEndpoint(.init(auth: env.auth, all: true))
                .map(\.notifications)
                .map(Action.didFetchNotifications)
                .catch { _ in Empty() }
                .receive(on: env.mainQueue)
                .eraseToEffect()

        case .didFetchNotifications(let notifications):
            state.notifications = notifications
            return .none

        case .statusBar(.quit):
            return .none
        }
    },
    StatusBar.reducer.pullback(
        state: \.statusBar,
        action: /Action.statusBar,
        environment: \.statusBar
    )
)
