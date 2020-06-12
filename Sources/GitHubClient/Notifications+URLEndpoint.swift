import Foundation
import SwiftEndpoint

extension Notifications {
    public static func urlEndpoint(
        publisherFactory: @escaping URLResponsePublisherFactory = URLSession.shared.urlResponsePublisherFactory
    ) -> Endpoint {
        SwiftEndpoint.urlEndpoint(
            requestFactory: urlRequest(for:),
            publisherFactory: publisherFactory,
            responseValidator: validate(data:urlResponse:),
            responseDecoder: decode(data:urlResponse:)
        )
    }

    private static func urlRequest(for request: Request) throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.github.com"
        urlComponents.path = "/notifications"
        urlComponents.queryItems = [.init(name: "all", value: "\(request.all)")]

        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"

        let username = request.auth.username
        let accessToken = request.auth.accessToken
        let authToken = "\(username):\(accessToken)".data(using: .utf8)!.base64EncodedString()
        urlRequest.setValue("Basic \(authToken)", forHTTPHeaderField: "Authorization")

        return urlRequest
    }

    private static func validate(data: Data, urlResponse: URLResponse) throws -> Void {
        guard let httpResponse = urlResponse as? HTTPURLResponse else {
            throw URLResponseError(data: data, response: urlResponse)
        }
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw HTTPURLResponseError(data: data, response: httpResponse)
        }
    }

    private static func decode(data: Data, urlResponse: URLResponse) throws -> Response {
        Response(notifications: try JSONDecoder().decode([Notification].self, from: data))
    }
}
