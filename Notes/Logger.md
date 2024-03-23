# Logger

`Logger` - An object for writing interpolated string messages to the unified logging system. 

`Logger` and `OSSignposter` for Apple platforms

> [swift-log](https://github.com/apple/swift-log) Logger interface for different implementation for logging

Name         | iOS | iPadOS | macOS | Mac Catalyst | tvOS | watchOS | visionOS
-------------|-----|--------|-------|--------------|------|---------|---------
OSLogStore   | 15  | 15     | 10.15 | 15           | 15   | 8       | 1
OSSignposter | 15  | 15     | 12    | 15           | 15   | 8       | 1
Logger       | 14  | 14     | 11    | 14           | 14   | 7       | 1
os_signpost  | 12  | 12     | 10.14 | 13           | 12   | 5       | 1
os_log       | 10  | 10     | 10.12 | 13           | 10   | 3       | 1


## Video

## Customizing Logging Behavior While Debugging

[Customizing Logging Behavior While Debugging](https://developer.apple.com/documentation/os/logging/customizing_logging_behavior_while_debugging?language=swift) this documentation contains configuration for Mac OS applications only. 

The description of the setup for iOS can be read in the command `man 5 os_log`. 

> If the following OSLogPreferences dictionary were in the Info.plist of an application, it would enable all levels and persist the Info and Default levels for the "Details" category in the "com.example" subsystem; and it would enable signpost backtraces for the "Measurements" category.

```xml
<key>OSLogPreferences</key>
<dict>
    <key>com.example</key>
    <dict>
        <key>Details</key>
        <dict>
            <key>Level</key>
            <dict>
                <key>Enable</key>
                <string>Debug</string>
                <key>Persist</key>
                <string>Info</string>
            </dict>
        </dict>
        <key>Measurements</key>
        <dict>
            <key>Signpost-Backtraces-Enabled</key>
            <true/>
        </dict>
    </dict>
</dict>
```

There are three levels for customizing behavior, but OSLogType has 5 types and Logger has 9 methods. It can be confusing. In order to understand them, a table is given below.

Level   | OSLogType  | Logger
--------|------------|--------------------
Default | `.fault`   | `fault`, `critical`  
Default | `.error`   | `error`, `warning`  
Default | `.default` | `log`, `notice`,  
Info    | `.info`    | `info`
Debug   | `.debug`   | `debug`, `trace`

The table shows that 3 `OSLogType` are hidden behind the Default level. And thus it does not allow us to turn off all logs and show only errors. Because of this, try not to use `OSLogType.default` or methods `Logger.log(_:)`, `Logger.notice(_:)`.
