import Quick
import Nimble
@testable import GitHub
import Foundation

class NotificationURLSpec: QuickSpec {
    override func spec() {
        it("should issue notification have correct web URL") {
            let notificationURL = "https://api.github.com/repos/octokit/octokit.rb/issues/123"
            let webURL = "https://github.com/octokit/octokit.rb/issues/123"
            expect(Notification.fixture(url: notificationURL).webURL) == URL(string: webURL)
        }

        it("should pull request notification have correct web URL") {
            let notificationURL = "https://api.github.com/repos/octokit/octokit.rb/pulls/321"
            let webURL = "https://github.com/octokit/octokit.rb/pull/321"
            expect(Notification.fixture(url: notificationURL).webURL) == URL(string: webURL)
        }

        it("should repo notification have correct web URL") {
            let notificationURL = "https://api.github.com/repos/octokit/octokit.rb"
            let webURL = "https://github.com/octokit/octokit.rb"
            expect(Notification.fixture(url: notificationURL).webURL) == URL(string: webURL)
        }

        it("should unknown notification have no web URL") {
            let notificationURL = "https://api.github.com/unknown/notification/path"
            expect(Notification.fixture(url: notificationURL).webURL).to(beNil())
        }
    }
}
