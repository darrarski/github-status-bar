public enum Action: Equatable {
    case terminateApp
}

extension Action {
    static func view(_ viewAction: ViewAction) -> Self {
        switch viewAction {
        case .didSelectQuit:
            return .terminateApp
        }
    }
}
