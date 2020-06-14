import Cocoa

final class MenuItem: NSMenuItem {

    init(title: String, action: @escaping () -> Void) {
        self.actionClosure = action
        super.init(title: title, action: #selector(menuItemAction), keyEquivalent: "")
        target = self
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
