# Swift Concurrency

### Flavors of tasks

Type               | Launched by     | Launchable from | Lifetime             | Cancellation    | Inherits from origin
-------------------|-----------------|-----------------|----------------------|-----------------|----------------------
async-let tasks    | `async let`     | async functions | scoped by statement  | automatic       | prioprity, task-local values
Group tasks        | `group.async`   | withTaskGroup   | scoped by task group | automatic       | prioprity, task-local values
Unstructured tasks | `Task.init`     | anywhere        | unscoped             | `Task.cancel()` | prioprity, task-local values, actor
Detached tasks     | `Task.detached` | anywhere        | unscoped             | `Task.cancel()` | nothing

### Presrving the runtime contracts

[Swift concurrency: Behind the scenes](https://developer.apple.com/videos/play/wwdc2021/10254/) at 24:40

:white_check_mark: Safe primitives | :warning: Caution required | :no_entry_sign: Unsafe Primitives
-----------------------------------|----------------------------|----------------------------------
await, Actors, Task groups         | `os_unfair_lock`, `NSLock` in synchronus code | `DispatchSemaphore`, `pthread_cond`, `NSCondition`, `pthread_rw_lock`, etc 
Compiler enforced                  | No compiler support        | No compiler support

## WWDC

### WWDC21 

Platforms: iOS 15, macOS 12

- [Meet async/await in Swift](https://developer.apple.com/wwdc21/10132)
- [Discover concurrency in SwiftUI](https://developer.apple.com/videos/play/wwdc2021/10019/)
- [Explore structured concurrency in Swift](https://developer.apple.com/videos/play/wwdc2021/10134/)
- [Swift concurrency: Update a sample app](https://developer.apple.com/videos/play/wwdc2021/10194/)
- [Use async/await with URLSession](https://developer.apple.com/videos/play/wwdc2021/10095/)
- [Bring Core Data concurrency to Swift and SwiftUI](https://developer.apple.com/videos/play/wwdc2021/10017/)
- [Swift concurrency: Behind the scenes](https://developer.apple.com/videos/play/wwdc2021/10254/)
- [Protect mutable state with Swift actors](https://developer.apple.com/videos/play/wwdc2021/10133/)

### WWDC22

Platforms: iOS 16, macOS 13

- [Meet Swift Async Algorithms](https://developer.apple.com/videos/play/wwdc2022/110355/)
- [Meet distributed actors in Swift](https://developer.apple.com/videos/play/wwdc2022/110356/)
- [Eliminate data races using Swift Concurrency](https://developer.apple.com/videos/play/wwdc2022/110351/)
- [Visualize and optimize Swift concurrency](https://developer.apple.com/wwdc22/110350)

## Conferences

- [2021 LLVM Dev Mtg "Asynchronous Functions in Swift"](https://youtu.be/H_K-us4-K7s)
- [Scale By The Bay 2021 : Konrad Malawski, Distributed Systems with Swift](https://youtu.be/7yu6mEq8R2Q)
- [Scale By The Bay 2021 : Tim Condon, Distributed Tracing with Swift](https://www.youtube.com/watch?v=Z2hfW06eyk0)
- [Swift Concurrency Under the Hood - iOS Conf SG 2022](https://www.youtube.com/watch?v=wp5vIVxABFk)

## Books

- [Modern Concurrency in Swift](https://www.raywenderlich.com/books/modern-concurrency-in-swift)
- [Advanced Swift](https://www.objc.io/books/advanced-swift/)

## Podcasts

- Swift Unwrapped
  - [27: Concurrency with Chris Lattner](https://swiftunwrapped.github.io/episodes/409cbdc5/)
  - [91: Concurrency, 3 years later](https://swiftunwrapped.github.io/episodes/spdcC97m/)
- The raywenderlich.com Podcast
  - [Modern Concurrency – Podcast S12 E01](https://www.raywenderlich.com/29460963-modern-concurrency-podcast-s12-e01)
- Swift by Sundell
  - [108: “Concurrency and Swift-DocC” with special guest Marin Todorov](https://swiftbysundell.com/podcast/108/)
  - [110: “Concurrency beyond app development” with special guest Tim Condon](https://swiftbysundell.com/podcast/110/)


## Proposals

- [Async/await](https://github.com/apple/swift-evolution/blob/main/proposals/0296-async-await.md)
- [Concurrency Interoperability with Objective-C](https://github.com/apple/swift-evolution/blob/main/proposals/0297-concurrency-objc.md)
- [Async/Await: Sequences](https://github.com/apple/swift-evolution/blob/main/proposals/0298-asyncsequence.md)
- [Continuations for interfacing async tasks with synchronous code](https://github.com/apple/swift-evolution/blob/main/proposals/0300-continuation.md)
- [Sendable and @Sendable closures](https://github.com/apple/swift-evolution/blob/main/proposals/0302-concurrent-value-and-concurrent-closures.md)
- [Structured concurrency](https://github.com/apple/swift-evolution/blob/main/proposals/0304-structured-concurrency.md)
- [Actors](https://github.com/apple/swift-evolution/blob/main/proposals/0306-actors.md)
- [Effectful Read-only Properties](https://github.com/apple/swift-evolution/blob/main/proposals/0310-effectful-readonly-properties.md)
- [Task Local Values](https://github.com/apple/swift-evolution/blob/main/proposals/0311-task-locals.md)
- [Improved control over actor isolation](https://github.com/apple/swift-evolution/blob/main/proposals/0313-actor-isolation-control.md)
- [AsyncStream and AsyncThrowingStream](https://github.com/apple/swift-evolution/blob/main/proposals/0314-async-stream.md)
- [Global actors](https://github.com/apple/swift-evolution/blob/main/proposals/0316-global-actors.md)
- [async let bindings](https://github.com/apple/swift-evolution/blob/main/proposals/0317-async-let.md)
- [Custom Executors](https://github.com/rjmccall/swift-evolution/blob/custom-executors/proposals/0000-custom-executors.md)
- [Distributed Actors](https://github.com/ktoso/swift-evolution/blob/distributed-revised/proposals/nnnn-distributed-actors.md)
- [Asynchronous Main Semantics](https://github.com/apple/swift-evolution/blob/main/proposals/0323-async-main-semantics.md)

