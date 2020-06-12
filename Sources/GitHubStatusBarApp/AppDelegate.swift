import Cocoa

public final class AppDelegate: NSObject, NSApplicationDelegate {

    var textOutput: AnyTextOutputStream = .stdout

    public func applicationDidFinishLaunching(_ notification: Notification) {
        print("Hello, World!", to: &textOutput)
        NSApp?.terminate(self)
    }

}
