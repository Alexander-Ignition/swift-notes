# Swift Asserts

[Debugging and Reflection](https://developer.apple.com/documentation/swift/swift_standard_library/debugging_and_reflection)

- `-Onone` the default for Xcode's **Debug** configuration
- `-O` the default for Xcode's **Release** configuration

Function name | Condition | In playgrounds and `-Onone` builds | In `-O` builds | In `-Ounchecked` builds
--------------|-----------|------------------------------------|----------------|------------------------
assert | :ballot_box_with_check: | :ballot_box_with_check: | |
assertionFailure | | :ballot_box_with_check: | |
precondition | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: |
preconditionFailure | | :ballot_box_with_check: | :ballot_box_with_check: |
fatalError | | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check:
dispatchPrecondition | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: |
