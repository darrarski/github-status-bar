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

private func url(for notification: GitHub.Notification) -> URL? {
    if let url = issueUrl(for: notification) {
        return url
    } else if let url = pullRequestUrl(for: notification) {
        return url
    } else if let url = repoUrl(for: notification) {
        return url
    }
    return nil
}

private func issueUrl(for notification: GitHub.Notification) -> URL? {
    let input = notification.subject.url
    let pattern = #"^https:\/\/api.github.com\/repos\/([^\/]+)\/([^\/]+)\/issues\/([0-9]+)$"#
    let regex = try! NSRegularExpression(pattern: pattern)
    let range = NSRange(input.startIndex..<input.endIndex, in: input)
    guard let match = regex.firstMatch(in: input, options: [], range: range),
        match.numberOfRanges == 4,
        let owner = Range(match.range(at: 1), in: input).map({ input[$0] }),
        let repo = Range(match.range(at: 2), in: input).map({ input[$0] }),
        let id = Range(match.range(at: 3), in: input).map({ input[$0] })
        else { return nil }

    return URL(string: "https://github.com/\(owner)/\(repo)/issues/\(id)")
}

private func pullRequestUrl(for notification: GitHub.Notification) -> URL? {
    let input = notification.subject.url
    let pattern = #"^https:\/\/api.github.com\/repos\/([^\/]+)\/([^\/]+)\/pulls\/([0-9]+)$"#
    let regex = try! NSRegularExpression(pattern: pattern)
    let range = NSRange(input.startIndex..<input.endIndex, in: input)
    guard let match = regex.firstMatch(in: input, options: [], range: range),
        match.numberOfRanges == 4,
        let owner = Range(match.range(at: 1), in: input).map({ input[$0] }),
        let repo = Range(match.range(at: 2), in: input).map({ input[$0] }),
        let id = Range(match.range(at: 3), in: input).map({ input[$0] })
        else { return nil }

    return URL(string: "https://github.com/\(owner)/\(repo)/pull/\(id)")
}

private func repoUrl(for notification: GitHub.Notification) -> URL? {
    let input = notification.subject.url
    let pattern = #"^https:\/\/api.github.com\/repos\/([^\/]+)\/([^\/]+)$"#
    let regex = try! NSRegularExpression(pattern: pattern)
    let range = NSRange(input.startIndex..<input.endIndex, in: input)
    guard let match = regex.firstMatch(in: input, options: [], range: range),
        match.numberOfRanges == 3,
        let owner = Range(match.range(at: 1), in: input).map({ input[$0] }),
        let repo = Range(match.range(at: 2), in: input).map({ input[$0] })
        else { return nil }

    return URL(string: "https://github.com/\(owner)/\(repo)")
}
