import Darwin

struct AnyTextOutputStream: TextOutputStream {
    init(_ write: @escaping (String) -> Void) {
        _write = write
    }

    func write(_ string: String) {
        _write(string)
    }

    private var _write: (String) -> Void
}

extension TextOutputStream {
    static var stdout: AnyTextOutputStream { .init { fputs($0, Darwin.stdout) } }
    static var stderr: AnyTextOutputStream { .init { fputs($0, Darwin.stderr) } }
}
