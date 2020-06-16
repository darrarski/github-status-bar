import Cocoa

final class MenuItem: NSMenuItem {

    init(title: String, action: @escaping () -> Void) {
        self.actionClosure = action
        super.init(title: title, action: #selector(menuItemAction), keyEquivalent: "")
        target = self
    }

    init(title: String, subitems: [NSMenuItem]) {
        self.actionClosure = nil
        super.init(title: title, action: nil, keyEquivalent: "")
        submenu = NSMenu()
        submenu?.items = subitems
    }

    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    @objc
    private func menuItemAction() {
        actionClosure?()
    }

    private let actionClosure: (() -> Void)?

}
