# GitHub Status Bar macOS App

![swift: v5.2](https://img.shields.io/badge/swift-v5.2-orange.svg)
![platform: macOS](https://img.shields.io/badge/platform-macOS-blue.svg)
![deployment target: v10.15](https://img.shields.io/badge/deployment%20target-v10.15-blueviolet)
![code coverage: 100%](https://img.shields.io/badge/code%20coverage-100%25-success)

GitHub notifications in macOS status bar. Written in Swift.

![](Docs/github-status-bar-menu-screenshot-with-bg.png)

This project demonstrates **unidirectional data flow architecture** implementation in a simple Swift application.

## 🚀 Build and run

### Requirements

- Xcode 11 with Swift 5.2

### Run

You can run the app directly from terminal, by executing:

```sh
GITHUB_USERNAME=user GITHUB_TOKEN=personal-access-token swift run
```

Replace environment variables with your actual credentials.

- `GITHUB_USERNAME` - GitHub username
- `GITHUB_TOKEN` - GitHub [Personal Access Token](https://github.com/settings/tokens)

## 🛠 Develop

### Setup

Open `Package.swift` in Xcode.You can run the app using `github-status-bar` shared build scheme. 

The GitHub credentials can be set in the scheme configuration:

![xcode-scheme-environment-variables.png](Docs/xcode-scheme-environment-variables.png)

### Test

You can run tests from Xcode or by executing the following command in terminal:

```sh
swift test
```

### Package structure

Target|Description
:--|:--
`Executable`|The macOS app executable
`App[Tests]`|Core application logic
`StatusBar[Tests]`|Status bar menu component
`GitHub[Tests]`|GitHub REST API v3 client

### External dependencies

Dependency|Description
:--|:--
[ComposableArchitecture](https://github.com/pointfreeco/swift-composable-architecture)|Architecture foundations
[SwiftEndpoint](https://github.com/darrarski/SwiftEndpoint)|Networking layer abstration
[Quick](https://github.com/Quick/Quick)|Behavior-driven development framework used in test targets
[Nimble](https://github.com/Quick/Nimble)|Assertion matcher framework used in test targets
[Difference](https://github.com/krzysztofzablocki/Difference)|Assertion helper framework used in test targets

## ☕️ Do you like the project?

<a href="https://www.buymeacoffee.com/darrarski" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="60" width="217" style="height: 60px !important;width: 217px !important;" ></a>

## 📄 License

Copyright © 2020 [Dariusz Rybicki Darrarski](http://www.darrarski.pl)

License: [GNU GPLv3](LICENSE)
