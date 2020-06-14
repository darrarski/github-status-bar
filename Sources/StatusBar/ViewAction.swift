enum ViewAction: Equatable {
    case didSelectQuit
}

extension ViewAction {
    var action: Action {
        switch self {
        case .didSelectQuit:
            return .terminateApp
        }
    }
}
