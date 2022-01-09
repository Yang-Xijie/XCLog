# HELP

## What are the differences between XCLog and os Logger?

[Logger](https://developer.apple.com/documentation/os/logger) provides the system-wide logging service that not only helps you trace your code when debugging in Xcode, but also collects data for you when users launch your app.

[XCLog](https://github.com/Yang-Xijie/XCLog) just provides a rather easier way to print message in console.

## Where should I use XCLog?

Referring to [Generating Log Messages from Your Code](https://developer.apple.com/documentation/os/logging/generating_log_messages_from_your_code):

> Insert log messages at appropriate points in your code and use them to diagnose issues later. Typically, you use log messages to:
> * Write a message at the start and end of functions and important tasks.
> * Write a message for any interesting events.
> * Write a message when a significant error occurs.
> * Write messages for important or unusual actions with a function. For example, log rarely taken code paths.
> * Write a message before each step of a multi-step task.

## What are the differences between different message types?

For more information, check https://stackoverflow.com/questions/2031163/when-to-use-the-different-log-levels.

To briefly conclude: ( use ... to ... )
* `TRACE`: present ordinary steps when app runs.
* `DEBUG`: help you find bugs.
* `INFO`:  present important events.
* `WARN`:  present underlying problems.
* `ERROR`: present definite problems that should be investigated.
* `FATAL`: present a fatal error that will crash your app.
