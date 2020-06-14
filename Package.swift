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
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture.git",
            from: "0.3.0"
        ),
        .package(
            url: "https://github.com/darrarski/SwiftEndpoint.git",
            from: "1.0.0"
        ),
        .package(
            url: "https://github.com/Quick/Quick.git",
            from: "3.0.0"
        ),
        .package(
            url: "https://github.com/Quick/Nimble.git",
            from: "8.1.1"
        ),
        .package(
            name: "SnapshotTesting",
            url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
            from: "1.8.0"
        ),
        .package(
            url: "https://github.com/krzysztofzablocki/Difference.git",
            .revision("50d0cf263aeea38a96549472d65358defb60cdb0")
        )
    ],
    targets: [
        .target(
            name: "GitHubStatusBarExecutable",
            dependencies: ["GitHubStatusBarApp"]
        ),
        .target(
            name: "GitHubStatusBarApp",
            dependencies: [
                .product(
                    name: "ComposableArchitecture",
                    package: "swift-composable-architecture"
                ),
                "GitHubClient",
                "SwiftEndpoint"
            ]
        ),
        .testTarget(
            name: "GitHubStatusBarAppTests",
            dependencies: [
                "GitHubStatusBarApp",
                "Quick",
                "Nimble",
                "SnapshotTesting"
            ]
        ),
        .target(
            name: "GitHubClient",
            dependencies: ["SwiftEndpoint"]
        ),
        .testTarget(
            name: "GitHubClientTests",
            dependencies: [
                "GitHubClient",
                "Quick",
                "Nimble",
                "Difference"
            ]
        )
    ]
)
