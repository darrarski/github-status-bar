import ComposableArchitecture
import StatusBar

public typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environment>

public let reducer = Reducer.combine(
    StatusBar.reducer.pullback(
        state: \.statusBar,
        action: /Action.statusBar,
        environment: \.statusBar
    )
)
