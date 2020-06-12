import Foundation

public struct URLResponseError: Error, Equatable {
    public var data: Data
    public var response: URLResponse
}
