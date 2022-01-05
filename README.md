# XCLog

`XCLog` is a Swift extension that helps you print something in console when debugging your projects.

## Installation

1. Open `Xcode > File > Add Packages...`.
2. Add `https://github.com/Yang-Xijie/XCLog`.

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
// [INFO]    22/01/05 01:36:43    greet(_:)    main.swift(11)
//     successfully
greet(nil)
// [ERROR]   22/01/05 01:37:51    greet(_:)    main.swift(7)
//     no name
```

If you want to disable `XCLog`, set `XCLog.enable` to `false` somewhere in your codes.

## Documentation

`XCLog` supports `DocC`. Use `Xcode > Product > Build Documentation` to check it.

## Hint

Referring to [Generating Log Messages from Your Code](https://developer.apple.com/documentation/os/logging/generating_log_messages_from_your_code):

Insert log messages at appropriate points in your code and use them to diagnose issues later. Typically, you use log messages to:
* Write a message at the start and end of functions and important tasks.
* Write a message for any interesting events.
* Write a message when a significant error occurs.
* Write messages for important or unusual actions with a function. For example, log rarely taken code paths.
* Write a message before each step of a multi-step task.
