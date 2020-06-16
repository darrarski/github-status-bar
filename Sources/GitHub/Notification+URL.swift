import Foundation

public extension Notification {
    var webURL: URL? {
        if let url = issueWebURL {
            return url
        } else if let url = pullRequestWebURL {
            return url
        }
        return repoWebURL
    }

    private var issueWebURL: URL? {
        let pattern = #"^https:\/\/api.github.com\/repos\/([^\/]+)\/([^\/]+)\/issues\/([0-9]+)$"#
        return subject.url.firstMatch(of: pattern)
            .map { match in "https://github.com/\(match[1])/\(match[2])/issues/\(match[3])" }
            .map { URL(string: $0) } as? URL
    }

    private var pullRequestWebURL: URL? {
        let pattern = #"^https:\/\/api.github.com\/repos\/([^\/]+)\/([^\/]+)\/pulls\/([0-9]+)$"#
        return subject.url.firstMatch(of: pattern)
            .map { match in "https://github.com/\(match[1])/\(match[2])/pull/\(match[3])" }
            .map { URL(string: $0) } as? URL
    }

    private var repoWebURL: URL? {
        let pattern = #"^https:\/\/api.github.com\/repos\/([^\/]+)\/([^\/]+)$"#
        return subject.url.firstMatch(of: pattern)
            .map { match in "https://github.com/\(match[1])/\(match[2])" }
            .map { URL(string: $0) } as? URL
    }
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
