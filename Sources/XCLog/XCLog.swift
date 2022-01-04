// XCLog.swift

import Foundation

/// Initialize `XCLog` to print something in console when debugging your projects
public struct XCLog {
    /// Enable `XCLog` to print in console of Xcode.
    ///
    /// If you want to disable `XCLog`, use `Log.enable = false` in codes.
    public static var enable: Bool = true

    /// Print message to console in Xcode using the default `XCLogType.info`.
    @discardableResult
    public init(_ message: String, fileID: String = #fileID, line: Int = #line, funcName: String = #function) {
        self.init(.info, message, fileID: fileID, line: line, funcName: funcName)
    }

    /// Print message to console in Xcode.
    @discardableResult
    public init(_ type: XCLogType, _ message: String, fileID: String = #fileID, line: Int = #line, funcName: String = #function) {
        if !Self.enable { return }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy/MM/dd HH:mm:ss"

        let log_date = dateFormatter.string(from: Date())

        print("[\(type.rawValue)]" + "\t" + log_date + "\t" + funcName + "\t" + "\((fileID as NSString).lastPathComponent)(\(line))")
        print("\t\(message)")
    }
}

/// The printing style of `XCLog`.
public enum XCLogType: String {
    case debug = "DEBUG"
    case info = "INFO"
    case error = "ERROR"
}
