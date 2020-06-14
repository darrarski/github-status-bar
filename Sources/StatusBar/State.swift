public struct State: Equatable {
    public init() {}
}

extension State {
    var view: ViewState {
        .init(title: "GitHub")
    }
}
