import Foundation

public struct Environemnt {
    public init(
        urlOpener: @escaping (URL) -> Void,
        appTerminator: @escaping (Any?) -> Void
    ) {
        self.urlOpener = urlOpener
        self.appTerminator = appTerminator
    }

    public var urlOpener: (URL) -> Void
    public var appTerminator: (Any?) -> Void
}
