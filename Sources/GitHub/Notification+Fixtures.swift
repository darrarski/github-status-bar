#if DEBUG
import Foundation

extension Notification {
    static let fixture: Notification = .init(
        id: "1",
        repository: .init(
            id: 1296269,
            nodeId: "MDEwOlJlcG9zaXRvcnkxMjk2MjY5",
            name: "Hello-World",
            fullName: "octocat/Hello-World",
            owner: .init(
                login: "octocat",
                id: 1,
                nodeId: "MDQ6VXNlcjE=",
                avatarUrl: "https://github.com/images/error/octocat_happy.gif",
                gravatarId: "",
                url: "https://api.github.com/users/octocat",
                htmlUrl: "https://github.com/octocat",
                followersUrl: "https://api.github.com/users/octocat/followers",
                followingUrl: "https://api.github.com/users/octocat/following{/other_user}",
                gistsUrl: "https://api.github.com/users/octocat/gists{/gist_id}",
                starredUrl: "https://api.github.com/users/octocat/starred{/owner}{/repo}",
                subscriptionsUrl: "https://api.github.com/users/octocat/subscriptions",
                organizationsUrl: "https://api.github.com/users/octocat/orgs",
                reposUrl: "https://api.github.com/users/octocat/repos",
                eventsUrl: "https://api.github.com/users/octocat/events{/privacy}",
                receivedEventsUrl: "https://api.github.com/users/octocat/received_events",
                type: "User",
                siteAdmin: false
            ),
            private: false,
            htmlUrl: "https://github.com/octocat/Hello-World",
            description: "This your first repo!",
            fork: false,
            url: "https://api.github.com/repos/octocat/Hello-World",
            archiveUrl: "http://api.github.com/repos/octocat/Hello-World/{archive_format}{/ref}",
            assigneesUrl: "http://api.github.com/repos/octocat/Hello-World/assignees{/user}",
            blobsUrl: "http://api.github.com/repos/octocat/Hello-World/git/blobs{/sha}",
            branchesUrl: "http://api.github.com/repos/octocat/Hello-World/branches{/branch}",
            collaboratorsUrl: "http://api.github.com/repos/octocat/Hello-World/collaborators{/collaborator}",
            commentsUrl: "http://api.github.com/repos/octocat/Hello-World/comments{/number}",
            commitsUrl: "http://api.github.com/repos/octocat/Hello-World/commits{/sha}",
            compareUrl: "http://api.github.com/repos/octocat/Hello-World/compare/{base}...{head}",
            contentsUrl: "http://api.github.com/repos/octocat/Hello-World/contents/{+path}",
            contributorsUrl: "http://api.github.com/repos/octocat/Hello-World/contributors",
            deploymentsUrl: "http://api.github.com/repos/octocat/Hello-World/deployments",
            downloadsUrl: "http://api.github.com/repos/octocat/Hello-World/downloads",
            eventsUrl: "http://api.github.com/repos/octocat/Hello-World/events",
            forksUrl: "http://api.github.com/repos/octocat/Hello-World/forks",
            gitCommitsUrl: "http://api.github.com/repos/octocat/Hello-World/git/commits{/sha}",
            gitRefsUrl: "http://api.github.com/repos/octocat/Hello-World/git/refs{/sha}",
            gitTagsUrl: "http://api.github.com/repos/octocat/Hello-World/git/tags{/sha}",
            gitUrl: "git:github.com/octocat/Hello-World.git",
            issueCommentUrl: "http://api.github.com/repos/octocat/Hello-World/issues/comments{/number}",
            issueEventsUrl: "http://api.github.com/repos/octocat/Hello-World/issues/events{/number}",
            issuesUrl: "http://api.github.com/repos/octocat/Hello-World/issues{/number}",
            keysUrl: "http://api.github.com/repos/octocat/Hello-World/keys{/key_id}",
            labelsUrl: "http://api.github.com/repos/octocat/Hello-World/labels{/name}",
            languagesUrl: "http://api.github.com/repos/octocat/Hello-World/languages",
            mergesUrl: "http://api.github.com/repos/octocat/Hello-World/merges",
            milestonesUrl: "http://api.github.com/repos/octocat/Hello-World/milestones{/number}",
            notificationsUrl: "http://api.github.com/repos/octocat/Hello-World/notifications{?since,all,participating}",
            pullsUrl: "http://api.github.com/repos/octocat/Hello-World/pulls{/number}",
            releasesUrl: "http://api.github.com/repos/octocat/Hello-World/releases{/id}",
            sshUrl: "git@github.com:octocat/Hello-World.git",
            stargazersUrl: "http://api.github.com/repos/octocat/Hello-World/stargazers",
            statusesUrl: "http://api.github.com/repos/octocat/Hello-World/statuses/{sha}",
            subscribersUrl: "http://api.github.com/repos/octocat/Hello-World/subscribers",
            subscriptionUrl: "http://api.github.com/repos/octocat/Hello-World/subscription",
            tagsUrl: "http://api.github.com/repos/octocat/Hello-World/tags",
            teamsUrl: "http://api.github.com/repos/octocat/Hello-World/teams",
            treesUrl: "http://api.github.com/repos/octocat/Hello-World/git/trees{/sha}"
        ),
        subject: .init(
            title: "Greetings",
            url: "https://api.github.com/repos/octokit/octokit.rb/issues/123",
            latestCommentUrl: "https://api.github.com/repos/octokit/octokit.rb/issues/comments/123",
            type: "Issue"
        ),
        reason: .subscribed,
        unread: true,
        updatedAt: date(from: "2014-11-07T22:01:45Z"),
        lastReadAt: date(from: "2014-11-07T22:01:45Z"),
        url: "https://api.github.com/notifications/threads/1"
    )

    static let fixtureJSON: String = """
    {
        "id": "1",
        "repository": {
            "id": 1296269,
            "node_id": "MDEwOlJlcG9zaXRvcnkxMjk2MjY5",
            "name": "Hello-World",
            "full_name": "octocat/Hello-World",
            "owner": {
                "login": "octocat",
                "id": 1,
                "node_id": "MDQ6VXNlcjE=",
                "avatar_url": "https://github.com/images/error/octocat_happy.gif",
                "gravatar_id": "",
                "url": "https://api.github.com/users/octocat",
                "html_url": "https://github.com/octocat",
                "followers_url": "https://api.github.com/users/octocat/followers",
                "following_url": "https://api.github.com/users/octocat/following{/other_user}",
                "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
                "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
                "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
                "organizations_url": "https://api.github.com/users/octocat/orgs",
                "repos_url": "https://api.github.com/users/octocat/repos",
                "events_url": "https://api.github.com/users/octocat/events{/privacy}",
                "received_events_url": "https://api.github.com/users/octocat/received_events",
                "type": "User",
                "site_admin": false
            },
            "private": false,
            "html_url": "https://github.com/octocat/Hello-World",
            "description": "This your first repo!",
            "fork": false,
            "url": "https://api.github.com/repos/octocat/Hello-World",
            "archive_url": "http://api.github.com/repos/octocat/Hello-World/{archive_format}{/ref}",
            "assignees_url": "http://api.github.com/repos/octocat/Hello-World/assignees{/user}",
            "blobs_url": "http://api.github.com/repos/octocat/Hello-World/git/blobs{/sha}",
            "branches_url": "http://api.github.com/repos/octocat/Hello-World/branches{/branch}",
            "collaborators_url": "http://api.github.com/repos/octocat/Hello-World/collaborators{/collaborator}",
            "comments_url": "http://api.github.com/repos/octocat/Hello-World/comments{/number}",
            "commits_url": "http://api.github.com/repos/octocat/Hello-World/commits{/sha}",
            "compare_url": "http://api.github.com/repos/octocat/Hello-World/compare/{base}...{head}",
            "contents_url": "http://api.github.com/repos/octocat/Hello-World/contents/{+path}",
            "contributors_url": "http://api.github.com/repos/octocat/Hello-World/contributors",
            "deployments_url": "http://api.github.com/repos/octocat/Hello-World/deployments",
            "downloads_url": "http://api.github.com/repos/octocat/Hello-World/downloads",
            "events_url": "http://api.github.com/repos/octocat/Hello-World/events",
            "forks_url": "http://api.github.com/repos/octocat/Hello-World/forks",
            "git_commits_url": "http://api.github.com/repos/octocat/Hello-World/git/commits{/sha}",
            "git_refs_url": "http://api.github.com/repos/octocat/Hello-World/git/refs{/sha}",
            "git_tags_url": "http://api.github.com/repos/octocat/Hello-World/git/tags{/sha}",
            "git_url": "git:github.com/octocat/Hello-World.git",
            "issue_comment_url": "http://api.github.com/repos/octocat/Hello-World/issues/comments{/number}",
            "issue_events_url": "http://api.github.com/repos/octocat/Hello-World/issues/events{/number}",
            "issues_url": "http://api.github.com/repos/octocat/Hello-World/issues{/number}",
            "keys_url": "http://api.github.com/repos/octocat/Hello-World/keys{/key_id}",
            "labels_url": "http://api.github.com/repos/octocat/Hello-World/labels{/name}",
            "languages_url": "http://api.github.com/repos/octocat/Hello-World/languages",
            "merges_url": "http://api.github.com/repos/octocat/Hello-World/merges",
            "milestones_url": "http://api.github.com/repos/octocat/Hello-World/milestones{/number}",
            "notifications_url": "http://api.github.com/repos/octocat/Hello-World/notifications{?since,all,participating}",
            "pulls_url": "http://api.github.com/repos/octocat/Hello-World/pulls{/number}",
            "releases_url": "http://api.github.com/repos/octocat/Hello-World/releases{/id}",
            "ssh_url": "git@github.com:octocat/Hello-World.git",
            "stargazers_url": "http://api.github.com/repos/octocat/Hello-World/stargazers",
            "statuses_url": "http://api.github.com/repos/octocat/Hello-World/statuses/{sha}",
            "subscribers_url": "http://api.github.com/repos/octocat/Hello-World/subscribers",
            "subscription_url": "http://api.github.com/repos/octocat/Hello-World/subscription",
            "tags_url": "http://api.github.com/repos/octocat/Hello-World/tags",
            "teams_url": "http://api.github.com/repos/octocat/Hello-World/teams",
            "trees_url": "http://api.github.com/repos/octocat/Hello-World/git/trees{/sha}"
        },
        "subject": {
            "title": "Greetings",
            "url": "https://api.github.com/repos/octokit/octokit.rb/issues/123",
            "latest_comment_url": "https://api.github.com/repos/octokit/octokit.rb/issues/comments/123",
            "type": "Issue"
        },
        "reason": "subscribed",
        "unread": true,
        "updated_at": "2014-11-07T22:01:45Z",
        "last_read_at": "2014-11-07T22:01:45Z",
        "url": "https://api.github.com/notifications/threads/1"
    }
    """
}

private func date(from string: String) -> Date {
    ISO8601DateFormatter().date(from: string)!
}
#endif
