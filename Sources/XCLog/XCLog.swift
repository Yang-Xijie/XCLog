// XCLog.swift

import Foundation

/// A `Swift` extension that helps you print something in console when debugging your projects.
public struct XCLog {
    /// Enable `XCLog` to print in console.
    ///
    /// If you want to disable `XCLog`, set `XCLog.enable` to `false` somewhere in your codes.
    public static var enable: Bool = true

    /// Print message in console using default `XCLogType`.
    @discardableResult
    public init(_ message: String, fileID: String = #fileID, line: Int = #line, funcName: String = #function) {
        self.init(.info, message, fileID: fileID, line: line, funcName: funcName)
    }

    /// Print message in console.
    @discardableResult
    public init(_ type: XCLogType, _ message: String, fileID: String = #fileID, line: Int = #line, funcName: String = #function) {
        if !Self.enable { return }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy/MM/dd HH:mm:ss"
        let date = dateFormatter.string(from: Date())

        print("[\(type.rawValue)]" + "\t" + date + "\t" + funcName + "\t" + "\((fileID as NSString).lastPathComponent)(\(line))")
        print("\t\(message)")
    }
}

/// Message type.
public enum XCLogType: String {
    case debug = "DEBUG"
    case info = "INFO"
    case error = "ERROR"
}
