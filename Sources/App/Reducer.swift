import Combine
import ComposableArchitecture
import GitHub
import StatusBar

public typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environment>

public let reducer = Reducer.combine(
    Reducer { state, action, env in
        switch action {
        case .didFinishLaunching:
            let request: Notifications.Request = .init(
                auth: Auth( // TODO: get credentials from key-chain
                    username: "user",
                    accessToken: "access-token"
                ),
                all: true
            )

            return env.notificationsEndpoint(request)
                .map(\.notifications)
                .map(Action.didFetchNotifications)
                .catch { _ in Empty() }
                .eraseToEffect()

        case .didFetchNotifications(let notifications):
            state.notifications = notifications
            return .none

        case .statusBar(_):
            return .none
        }
    },
    StatusBar.reducer.pullback(
        state: \.statusBar,
        action: /Action.statusBar,
        environment: \.statusBar
    )
)
