# Grand Central Dispatch Performance Anti-Pattern

WWDC18 [What's New in LLVM](https://developer.apple.com/videos/play/wwdc2018/409/) at 16:48

Performance implications: slowdown and hangs

```objc
__block NSString *taskName = nil;
dispatch_semaphore_t sema = dispatch_semaphore_create(0); 

[self.connection.remoteObjectProxy requestCurrentTaskName:^(NSString *task) {
    taskName = task;
    dispatch_semaphore_signal(sema); 
}];

dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER); 
return taskName;
```

- Blocks current thread by the execution on a different queue
- The task queue usually has lower priority, leads to priority inversion 
- Spawns useless threads

If available, use synchronous version of the API

```objc
__block NSString *taskName = nil;
id remoteObjectProxy = [self.connection synchronousRemoteObjectProxyWithErrorHandler: ^(NSError *error) { 
    NSLog(@“Error: %@“, error); 
}]; 
[remoteObjectProxy requestCurrentTaskName:^(NSString *task) {
    taskName = task; 
}];
return taskName;
```

Alternatively, use the API in an asynchronous manner

```objc
[self.connection.remoteObjectProxy requestCurrentTaskName:^(NSString *task) { 
    completionHandler(task);
}];
```

Enabling check in build settings `CLANG_ANALYZER_GCD_PERFORMANCE`
