import Cocoa

public final class AppDelegate: NSObject, NSApplicationDelegate {

    public func applicationDidFinishLaunching(_ notification: Notification) {
        print("Hello, world!")
        NSApp?.terminate(self)
    }

}
