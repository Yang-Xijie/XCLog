// XCLog.swift

import Foundation

/// A `Swift` extension that helps you print something in console when debugging your projects.
public struct XCLog {
    /// Enable `XCLog` to print in console.
    ///
    /// If you want to disable `XCLog`, set `XCLog.enable` to `false` somewhere in your codes.
    public static var enable: Bool = true

    /// Enable `XCLog` to print some types of message in console.
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

    /// Print in console with no message.
    @discardableResult
    public init(_ type: XCLogType = .trace, _ enable: Bool = true, fileID: String = #fileID, line: Int = #line, function: String = #function) {
        self.init(type, "", enable, fileID: fileID, line: line, function: function)
    }

    /// Print message in console using default `XCLogType`.
    @discardableResult
    public init(_ message: String, _ enable: Bool = true, fileID: String = #fileID, line: Int = #line, function: String = #function) {
        self.init(.info, message, enable, fileID: fileID, line: line, function: function)
    }

    /// Print message in console.
    @discardableResult
    public init(_ type: XCLogType, _ message: String, _ enable: Bool = true, fileID: String = #fileID, line: Int = #line, function: String = #function) {
        if Self.enable, Self.enableDict[type] ?? true, enable {
            // MARK: notation

            let string_type = "[\(type.rawValue)]"
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yy/MM/dd HH:mm:ss"
            let string_date = dateFormatter.string(from: Date())
            let string_file = "\((fileID as NSString).lastPathComponent)(\(line))"
            let string_func = function

            print(string_type + "\t" + "[" + string_date + "\t" + string_file + "\t" + string_func + "]")

            // MARK: message

            if message != "" {
                // replacingOccurrences: multi-line message support
                print("\t\t\(message.replacingOccurrences(of: "\n", with: "\n\t\t", options: .literal, range: nil))")
            }
        } else { return }
    }
}

/// Message type.
public enum XCLogType: String {
    case trace = "TRACE"
    case debug = "DEBUG"
    case info = "INFO"
    case warn = "WARN"
    case error = "ERROR"
    case fatal = "FATAL"
}
