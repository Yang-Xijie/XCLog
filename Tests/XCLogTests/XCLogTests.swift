@testable import XCLog
import XCTest

final class MyLibraryTests: XCTestCase {
    func test() {
        XCLog(.trace)
        XCLog(.info)
        XCLog(.debug)
        XCLog(.warn)
        XCLog(.error)
        XCLog(.fatal)

        XCLog("")
        XCLog("1")
        XCLog("1\n2")
        XCLog("1", "2")
        XCLog("1", "2", separator: ",")
        XCLog("1", "2", separator: "\n")
        XCLog(["1", "2"], separator: ",")
        XCLog(["1", "2"], separator: "\n")
        XCLog(["1", "2"], "3", "4", separator: ",")
        XCLog(["1", "2"], "3", "4", separator: "\n")

        XCLog(.debug, "")
        XCLog(.debug, "1")
        XCLog(.debug, "1\n2")
        XCLog(.debug, "1", "2")
        XCLog(.debug, "1", "2", separator: ",")
        XCLog(.debug, "1", "2", separator: "\n")
        XCLog(.debug, ["1", "2"], separator: ",")
        XCLog(.debug, ["1", "2"], separator: "\n")
        XCLog(.debug, ["1", "2"], "3", "4", separator: ",")
        XCLog(.debug, ["1", "2"], "3", "4", separator: "\n")

        XCLog.debug("")
        XCLog.debug("1")
        XCLog.debug("1\n2")
        XCLog.debug("1", "2")
        XCLog.debug("1", "2", separator: ",")
        XCLog.debug("1", "2", separator: "\n")
        XCLog.debug(["1", "2"], separator: ",")
        XCLog.debug(["1", "2"], separator: "\n")
        XCLog.debug(["1", "2"], "3", "4", separator: ",")
        XCLog.debug(["1", "2"], "3", "4", separator: "\n")
    }
}
