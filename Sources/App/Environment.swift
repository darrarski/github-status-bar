import StatusBar

public struct Environment {
    public init(appTerminator: @escaping (Any?) -> Void) {
        self.appTerminator = appTerminator
    }

    public var appTerminator: (Any?) -> Void
}

extension Environment {
    var statusBar: StatusBar.Environemnt {
        .init(appTerminator: appTerminator)
    }
}
