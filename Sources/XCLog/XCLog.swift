import Foundation

/// A `Swift` extension that helps you print something in console when debugging your projects.
public struct XCLog {
    /// Enable `XCLog` to print in console.
    ///
    /// If you want to disable `XCLog`, set `XCLog.enable` to `false` somewhere in your codes.
    public static var enable = true

    /// Enable `XCLog` to print some types of items in console.
    ///
    /// If you want to disable printing some `XCLogType`, set `XCLog.enableDict[XCLogType]` to `false` somewhere in your codes.
    public static var enableDict: [XCLogType: Bool] = [
        .trace: true,
        .debug: true,
        .info: true,
        .warn: true,
        .error: true,
        .fatal: true,
    ]

    /// Disable several types that are less important.
    ///
    /// For example, call `XCLog.disableTypes(lessImportantThan: .warn)` somewhere in your codes to only show `XCLogType` of `.warn` `.error` and `.fatal`.
    public static func disableTypes(lessImportantThan type: XCLogType) {
        for (key, _) in enableDict {
            if key < type {
                enableDict[key] = false
            } else {
                enableDict[key] = true
            }
        }
    }

    /// Print items in console.
    @discardableResult
    public init(_ type: XCLogType,
                _ items: Any..., separator: String = " ",
                enable: Bool = true,
                fileID: String = #fileID, line: Int = #line, function: String = #function) {
        self.init(type,
                  items: items, separator: separator,
                  enable: enable,
                  fileID: fileID, line: line, function: function)
    }

    /// Print items in console.
    @discardableResult
    public init(_ type: XCLogType,
                items: [Any], separator: String = " ",
                enable: Bool = true,
                fileID: String = #fileID, line: Int = #line, function: String = #function) {
        if Self.enable, Self.enableDict[type] ?? true, enable {
            // MARK: notation

            let string_type = "[\(type.name)]"
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yy/MM/dd HH:mm:ss"
            let string_date = dateFormatter.string(from: Date())
            let string_file = "\((fileID as NSString).lastPathComponent)(\(line))"
            let string_func = function

            print(string_type + "\t" + "[" + string_date + "\t" + string_file + "\t" + string_func + "]")

            // MARK: message

            let message = Array(items).map { item in
                return String(describing: item)
            }
            .joined(separator: separator)
            if message != "" {
                // replacingOccurrences: multi-line message support
                print("\t\t\(message.replacingOccurrences(of: "\n", with: "\n\t\t", options: .literal, range: nil))")
            } else { return }
        } else { return }
    }

    /// Print in console with no item.
    @discardableResult
    public init(_ type: XCLogType = .trace,
                enable: Bool = true,
                fileID: String = #fileID, line: Int = #line, function: String = #function) {
        self.init(type, "",
                  enable: enable,
                  fileID: fileID, line: line, function: function)
    }

    /// Print items in console using default `XCLogType.info`.
    @discardableResult
    public init(_ items: Any..., separator: String = " ",
                enable: Bool = true,
                fileID: String = #fileID, line: Int = #line, function: String = #function) {
        self.init(.info, items, separator: separator,
                  enable: enable,
                  fileID: fileID, line: line, function: function)
    }

    public static func trace(_ items: Any..., separator: String = " ",
                             enable: Bool = true,
                             fileID: String = #fileID, line: Int = #line, function: String = #function) {
        self.init(.trace, items, separator: separator,
                  enable: enable,
                  fileID: fileID, line: line, function: function)
    }

    public static func debug(_ items: Any..., separator: String = " ",
                             enable: Bool = true,
                             fileID: String = #fileID, line: Int = #line, function: String = #function) {
        self.init(.debug, items, separator: separator,
                  enable: enable,
                  fileID: fileID, line: line, function: function)
    }

    public static func info(_ items: Any..., separator: String = " ",
                            enable: Bool = true,
                            fileID: String = #fileID, line: Int = #line, function: String = #function) {
        self.init(.info, items, separator: separator,
                  enable: enable,
                  fileID: fileID, line: line, function: function)
    }

    public static func warn(_ items: Any..., separator: String = " ",
                            enable: Bool = true,
                            fileID: String = #fileID, line: Int = #line, function: String = #function) {
        self.init(.warn, items, separator: separator,
                  enable: enable,
                  fileID: fileID, line: line, function: function)
    }

    public static func error(_ items: Any..., separator: String = " ",
                             enable: Bool = true,
                             fileID: String = #fileID, line: Int = #line, function: String = #function) {
        self.init(.error, items, separator: separator,
                  enable: enable,
                  fileID: fileID, line: line, function: function)
    }

    public static func fatal(_ items: Any..., separator: String = " ",
                             enable: Bool = true,
                             fileID: String = #fileID, line: Int = #line, function: String = #function) {
        self.init(.fatal, items, separator: separator,
                  enable: enable,
                  fileID: fileID, line: line, function: function)
    }
}
