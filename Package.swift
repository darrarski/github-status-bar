// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "github-status-bar",
    platforms: [.macOS(.v10_15)],
    products: [
        .executable(
            name: "gh-bar",
            targets: ["Executable"]
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
            url: "https://github.com/krzysztofzablocki/Difference.git",
            .revision("50d0cf263aeea38a96549472d65358defb60cdb0")
        )
    ],
    targets: [
        .target(
            name: "Executable",
            dependencies: ["App"]
        ),
        .target(
            name: "App",
            dependencies: [
                "StatusBar",
                .product(
                    name: "ComposableArchitecture",
                    package: "swift-composable-architecture"
                )
            ]
        ),
        .testTarget(
            name: "AppTests",
            dependencies: [
                "App",
                "Quick",
                "Nimble"
            ]
        ),
        .target(
            name: "StatusBar",
            dependencies: [
                .product(
                    name: "ComposableArchitecture",
                    package: "swift-composable-architecture"
                )
            ]
        ),
        .testTarget(
            name: "StatusBarTests",
            dependencies: [
                "StatusBar",
                "Quick",
                "Nimble"
            ]
        ),
        .target(
            name: "GitHub",
            dependencies: ["SwiftEndpoint"]
        ),
        .testTarget(
            name: "GitHubTests",
            dependencies: [
                "GitHub",
                "Quick",
                "Nimble",
                "Difference"
            ]
        )
    ]
)
