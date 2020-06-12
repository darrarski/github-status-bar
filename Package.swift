// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "github-status-bar",
    platforms: [.macOS(.v10_15)],
    products: [
        .executable(
            name: "gh-bar",
            targets: ["GitHubStatusBarApp"]
        )
    ],
    dependencies: [],
    targets: [
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
