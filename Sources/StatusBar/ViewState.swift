struct ViewState: Equatable {
    var title: String
}

extension ViewState {
    static func state(_ state: State) -> ViewState {
        .init(title: "GitHub")
    }
}
