import ComposableArchitecture
import Foundation
import GitHub

public typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environemnt>

public let reducer = Reducer { state, action, env in
    switch action {
    case .openNotification(let id):
        if let url = state.notifications.first(where: { $0.id == id }).map(url(for:)) as? URL {
            env.urlOpener(url)
        }
        return .none
    case .refresh:
        return .none
    case .quit:
        env.appTerminator(nil)
        return .none
    }
}

// TODO: move to GitHub

private func url(for notification: GitHub.Notification) -> URL? {
    if let url = issueUrl(for: notification) {
        return url
    } else if let url = pullRequestUrl(for: notification) {
        return url
    }
    return repoUrl(for: notification)
}

private func issueUrl(for notification: GitHub.Notification) -> URL? {
    let pattern = #"^https:\/\/api.github.com\/repos\/([^\/]+)\/([^\/]+)\/issues\/([0-9]+)$"#
    return notification.subject.url.firstMatch(of: pattern)
        .map { match in "https://github.com/\(match[1])/\(match[2])/issues/\(match[3])" }
        .map { URL(string: $0) } as? URL
}

private func pullRequestUrl(for notification: GitHub.Notification) -> URL? {
    let pattern = #"^https:\/\/api.github.com\/repos\/([^\/]+)\/([^\/]+)\/pulls\/([0-9]+)$"#
    return notification.subject.url.firstMatch(of: pattern)
        .map { match in "https://github.com/\(match[1])/\(match[2])/pull/\(match[3])" }
        .map { URL(string: $0) } as? URL
}

private func repoUrl(for notification: GitHub.Notification) -> URL? {
    let pattern = #"^https:\/\/api.github.com\/repos\/([^\/]+)\/([^\/]+)$"#
    return notification.subject.url.firstMatch(of: pattern)
        .map { match in "https://github.com/\(match[1])/\(match[2])" }
        .map { URL(string: $0) } as? URL
}

private extension String {
    func firstMatch(of pattern: String) -> [String]? {
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(startIndex..<endIndex, in: self)
        guard let match = regex.firstMatch(in: self, options: [], range: range),
            match.numberOfRanges == regex.numberOfCaptureGroups + 1
            else { return nil }

        return (0..<match.numberOfRanges)
                .map { Range(match.range(at: $0), in: self)! }
                .map { String(self[$0]) }
    }
}
