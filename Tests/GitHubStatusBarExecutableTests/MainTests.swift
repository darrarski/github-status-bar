import XCTest
import class Foundation.Bundle

final class MainTests: XCTestCase {

    func testRun() throws {
        let binaryURL = Bundle.allBundles
            .first(where: { $0.bundlePath.hasSuffix(".xctest") })
            .map(\.bundleURL)?
            .deletingLastPathComponent()
            .appendingPathComponent("gh-bar")

        let process = Process()
        process.executableURL = binaryURL

        let pipe = Pipe()
        process.standardOutput = pipe

        try process.run()
        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)

        XCTAssertEqual(output, "Hello, world!\n")
    }

}
