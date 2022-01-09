# XCLog

`XCLog` is a Swift extension that helps you print something in console when debugging your projects.

## Installation

1. Go to `Xcode > File > Add Packages...`.
2. Search for `https://github.com/Yang-Xijie/XCLog` and add it in your project.

## Usage

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
// [INFO]    22/01/05 01:36:43    main.swift(11)    greet(_:)
//     successfully
greet(nil)
// [ERROR]   22/01/05 01:37:51    main.swift(7)    greet(_:)
//     no name
```

If you want to disable `XCLog`, set `XCLog.enable` to `false` somewhere in your codes.

## Documentation

* `XCLog` supports `DocC`. Use `Xcode > Product > Build Documentation` to check it.
* Check other documentation in `Docs/`.
