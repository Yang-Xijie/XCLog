import Foundation

/// Message type.
public enum XCLogType {
    case trace, debug, info, warn, error, fatal

    var name: String {
        switch self {
        case .trace:
            return "TRACE"
        case .debug:
            return "DEBUG"
        case .info:
            return "INFO"
        case .warn:
            return "WARN"
        case .error:
            return "ERROR"
        case .fatal:
            return "FATAL"
        }
    }
}

extension XCLogType: Comparable {
    public static func < (lhs: XCLogType, rhs: XCLogType) -> Bool {
        switch lhs {
        case .trace:
            switch rhs {
            case .trace:
                return false
            case .debug:
                return true
            case .info:
                return true
            case .warn:
                return true
            case .error:
                return true
            case .fatal:
                return true
            }
        case .debug:
            switch rhs {
            case .trace:
                return false
            case .debug:
                return false
            case .info:
                return true
            case .warn:
                return true
            case .error:
                return true
            case .fatal:
                return true
            }
        case .info:
            switch rhs {
            case .trace:
                return false
            case .debug:
                return false
            case .info:
                return false
            case .warn:
                return true
            case .error:
                return true
            case .fatal:
                return true
            }
        case .warn:
            switch rhs {
            case .trace:
                return false
            case .debug:
                return false
            case .info:
                return false
            case .warn:
                return false
            case .error:
                return true
            case .fatal:
                return true
            }
        case .error:
            switch rhs {
            case .trace:
                return false
            case .debug:
                return false
            case .info:
                return false
            case .warn:
                return false
            case .error:
                return false
            case .fatal:
                return true
            }
        case .fatal:
            switch rhs {
            case .trace:
                return false
            case .debug:
                return false
            case .info:
                return false
            case .warn:
                return false
            case .error:
                return false
            case .fatal:
                return false
            }
        }
    }
}
