struct ViewState: Equatable {
    var title: String
}

extension ViewState {
    static func state(_ state: State) -> ViewState {
        .init(title: title(for: state))
    }

    private static func title(for state: State) -> String {
        var title = "GitHub"
        let notificationsCount = state.notifications.count
        if notificationsCount > 0 {
            title.append(" (\(notificationsCount))")
        }
        return title
    }
}
