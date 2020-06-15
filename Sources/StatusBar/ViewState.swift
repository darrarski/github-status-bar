struct ViewState: Equatable {
    var notifications: [Notification]
}

extension ViewState {
    struct Notification: Equatable {
        var title: String
        var unread: Bool
        var read: Bool { !unread }
    }
}

extension ViewState {
    static func state(_ state: State) -> ViewState {
        .init(notifications: state.notifications.map {
            .init(
                title: $0.subject.title,
                unread: $0.unread
            )
        })
    }
}
