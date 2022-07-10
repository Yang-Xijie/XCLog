@testable import XCLog
import XCTest

final class MyLibraryTests: XCTestCase {
    func testCommonPrint() {
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

    func testDisableEnableSingle() {
        XCLog(.trace)
        XCLog(.debug)
        XCLog(.info)
        XCLog(.warn)
        XCLog(.error)
        XCLog(.fatal)

        XCLog.disable(.trace)
        XCLog.disable(.debug)
        XCLog.disable(.info)
        XCLog.disable(.warn)
        XCLog.disable(.error)
        XCLog.disable(.fatal)

        XCLog(.trace)
        XCLog(.debug)
        XCLog(.info)
        XCLog(.warn)
        XCLog(.error)
        XCLog(.fatal)

        XCLog.enable(.trace)
        XCLog.enable(.debug)
        XCLog.enable(.info)
        XCLog.enable(.warn)
        XCLog.enable(.error)
        XCLog.enable(.fatal)

        XCLog(.trace)
        XCLog(.debug)
        XCLog(.info)
        XCLog(.warn)
        XCLog(.error)
        XCLog(.fatal)
    }

    func testDisableTypesLessImportantThanTrace() {
        XCLog.disableTypes(lessImportantThan: .trace)

        XCLog(.trace)
        XCLog(.debug)
        XCLog(.info)
        XCLog(.warn)
        XCLog(.error)
        XCLog(.fatal)
    }

    func testDisableTypesLessImportantThanInfo() {
        XCLog.disableTypes(lessImportantThan: .info)

        XCLog(.trace)
        XCLog(.debug)
        XCLog(.info)
        XCLog(.warn)
        XCLog(.error)
        XCLog(.fatal)
    }

    func testDisableTypesLessImportantThanDebug() {
        XCLog.disableTypes(lessImportantThan: .debug)

        XCLog(.trace)
        XCLog(.debug)
        XCLog(.info)
        XCLog(.warn)
        XCLog(.error)
        XCLog(.fatal)
    }

    func testDisableTypesLessImportantThanWarn() {
        XCLog.disableTypes(lessImportantThan: .warn)

        XCLog(.trace)
        XCLog(.debug)
        XCLog(.info)
        XCLog(.warn)
        XCLog(.error)
        XCLog(.fatal)
    }

    func testDisableTypesLessImportantThanError() {
        XCLog.disableTypes(lessImportantThan: .error)

        XCLog(.trace)
        XCLog(.debug)
        XCLog(.info)
        XCLog(.warn)
        XCLog(.error)
        XCLog(.fatal)
    }

    func testDisableTypesImportantThanFatal() {
        XCLog.disableTypes(lessImportantThan: .fatal)

        XCLog(.trace)
        XCLog(.debug)
        XCLog(.info)
        XCLog(.warn)
        XCLog(.error)
        XCLog(.fatal)
    }
}
