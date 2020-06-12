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
        .testTarget(
            name: "GitHubStatusBarExecutableTests",
            dependencies: ["GitHubStatusBarExecutable"]
        ),
        .target(
            name: "GitHubStatusBarApp",
            dependencies: []
        ),
        .testTarget(
            name: "GitHubStatusBarAppTests",
            dependencies: ["GitHubStatusBarApp"]
        )
    ]
)
