import Foundation

public struct Notification: Decodable, Equatable {
    public var id: String
    public var repository: Repository
    public var subject: Subject
    public var reason: Reason
    public var unread: Bool
    public var updatedAt: Date
    public var lastReadAt: Date?
    public var url: String
}

public extension Notification {
    struct Repository: Decodable, Equatable {
        public var id: Int
        public var nodeId: String
        public var name: String
        public var fullName: String
        public var owner: Owner
        public var `private`: Bool
        public var htmlUrl: String
        public var description: String?
        public var fork: Bool
        public var url: String
        public var archiveUrl: String
        public var assigneesUrl: String
        public var blobsUrl: String
        public var branchesUrl: String
        public var collaboratorsUrl: String
        public var commentsUrl: String
        public var commitsUrl: String
        public var compareUrl: String
        public var contentsUrl: String
        public var contributorsUrl: String
        public var deploymentsUrl: String
        public var downloadsUrl: String
        public var eventsUrl: String
        public var forksUrl: String
        public var gitCommitsUrl: String
        public var gitRefsUrl: String
        public var gitTagsUrl: String
        public var gitUrl: String?
        public var issueCommentUrl: String
        public var issueEventsUrl: String
        public var issuesUrl: String
        public var keysUrl: String
        public var labelsUrl: String
        public var languagesUrl: String
        public var mergesUrl: String
        public var milestonesUrl: String
        public var notificationsUrl: String
        public var pullsUrl: String
        public var releasesUrl: String
        public var sshUrl: String?
        public var stargazersUrl: String
        public var statusesUrl: String
        public var subscribersUrl: String
        public var subscriptionUrl: String
        public var tagsUrl: String
        public var teamsUrl: String
        public var treesUrl: String
    }
}

public extension Notification.Repository {
    struct Owner: Decodable, Equatable {
        public var login: String
        public var id: Int
        public var nodeId: String
        public var avatarUrl: String
        public var gravatarId: String
        public var url: String
        public var htmlUrl: String
        public var followersUrl: String
        public var followingUrl: String
        public var gistsUrl: String
        public var starredUrl: String
        public var subscriptionsUrl: String
        public var organizationsUrl: String
        public var reposUrl: String
        public var eventsUrl: String
        public var receivedEventsUrl: String
        public var type: String
        public var siteAdmin: Bool
    }
}

public extension Notification {
    struct Subject: Decodable, Equatable {
        public var title: String
        public var url: String
        public var latestCommentUrl: String?
        public var type: String
    }
}

public extension Notification {
    enum Reason: String, Decodable {
        case assign
        case author
        case comment
        case invitation
        case manual
        case mention
        case reviewRequested = "review_requested"
        case securityAlert = "security_alert"
        case stateChange = "state_change"
        case subscribed
        case teamMention = "team_mention"
    }
}
