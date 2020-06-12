// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "github-status-bar",
    platforms: [.macOS(.v10_15)],
    products: [
        .executable(
            name: "gh-bar",
            targets: ["GitHubStatusBarExecutable"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GitHubStatusBarExecutable",
            dependencies: ["GitHubStatusBarApp"]
        ),
        .target(
            name: "GitHubStatusBarApp",
            dependencies: ["GitHubClient"]
        ),
        .testTarget(
            name: "GitHubStatusBarAppTests",
            dependencies: ["GitHubStatusBarApp"]
        ),
        .target(
            name: "GitHubClient",
            dependencies: []
        ),
        .testTarget(
            name: "GitHubClientTests",
            dependencies: ["GitHubClient"]
        )
    ]
)
