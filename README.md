# XCLog

`XCLog` is a Swift extension that helps you print something in console when debugging your projects.

## Installation

Open `Xcode > File > Add Packages...` and add `https://github.com/Yang-Xijie/XCLog`.

## Usage Examples

```swift
import Foundation
import XCLog

func greet(_ name: String!) {
    guard let name = name else {
        XCLog(.error, "no name")
        return
    }
    print("Hello, \(name)!")
    XCLog("successfully")
}

greet("Roger")
// Hello, Roger!
// [INFO]    22/01/05 01:36:43    greet(_:)    main.swift(11)
//     successfully
greet(nil)
// [ERROR]   22/01/05 01:37:51    greet(_:)    main.swift(7)
//     no name
```
