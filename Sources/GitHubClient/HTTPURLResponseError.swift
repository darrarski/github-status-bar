import Foundation

public struct HTTPURLResponseError: Error, Equatable {
    public var data: Data
    public var response: HTTPURLResponse
}
