# CoreData Requests

[NSPersistentStoreRequest]: https://developer.apple.com/documentation/coredata/nspersistentstorerequest
[NSFetchRequest]: https://developer.apple.com/documentation/coredata/nsfetchrequest
[NSAsynchronousFetchRequest]: https://developer.apple.com/documentation/coredata/nsasynchronousfetchrequest
[NSSaveChangesRequest]: https://developer.apple.com/documentation/coredata/nssavechangesrequest
[NSBatchUpdateRequest]: https://developer.apple.com/documentation/coredata/nsbatchupdaterequest
[NSBatchDeleteRequest]: https://developer.apple.com/documentation/coredata/nsbatchdeleterequest
[NSPersistentHistoryChangeRequest]: https://developer.apple.com/documentation/coredata/nspersistenthistorychangerequest
[NSBatchInsertRequest]: https://developer.apple.com/documentation/coredata/nsbatchinsertrequest

[`NSPersistentStoreRequest`](https://developer.apple.com/documentation/coredata/nspersistentstorerequest) base class for all CoreData Requests.

## Available

Request                            | iOS | macOS | Catalyst | tvOS | watchOS
-----------------------------------|-----|-------|----------|------|--------
[NSPersistentStoreRequest]         | 5   | 10.7  | 13       | 9    | 2
[NSFetchRequest]                   | 3   | 10.4  | 13       | 9    | 2
[NSAsynchronousFetchRequest]       | 5   | 10.7  | 13       | 9    | 2
[NSSaveChangesRequest]             | 5   | 10.7  | 13       | 9    | 2
[NSBatchUpdateRequest]             | 8   | 10.10 | 13       | 9    | 2
[NSBatchDeleteRequest]             | 9   | 10.11 | 13       | 9    | 2
[NSPersistentHistoryChangeRequest] | 11  | 10.13 | 13       | 11   | 4
[NSBatchInsertRequest]             | 13  | 10.15 | 13       | 13   | 6

## Result classes

[NSPersistentStoreResult]: https://developer.apple.com/documentation/coredata/nspersistentstoreresult
[NSPersistentStoreAsynchronousResult]: https://developer.apple.com/documentation/coredata/nspersistentstoreasynchronousresult
[NSAsynchronousFetchResult]: https://developer.apple.com/documentation/coredata/nsasynchronousfetchresult
[NSBatchUpdateResult]: https://developer.apple.com/documentation/coredata/nsbatchupdateresult
[NSBatchDeleteResult]: https://developer.apple.com/documentation/coredata/nsbatchdeleteresult
[NSPersistentHistoryResult]: https://developer.apple.com/documentation/coredata/nspersistenthistoryresult
[NSBatchInsertResult]: https://developer.apple.com/documentation/coredata/nsbatchinsertresult

Result class inheritance

- [NSPersistentStoreResult]
  - [NSPersistentStoreAsynchronousResult]
    - [NSAsynchronousFetchResult]
  - [NSBatchUpdateResult]
  - [NSBatchDeleteResult]
  - [NSPersistentHistoryResult]
  - [NSBatchInsertResult]

## Result types

[NSFetchRequestResultType]: https://developer.apple.com/documentation/coredata/nsfetchrequestresulttype
[NSBatchUpdateRequestResultType]: https://developer.apple.com/documentation/coredata/nsbatchupdaterequestresulttype
[NSBatchDeleteRequestResultType]: https://developer.apple.com/documentation/coredata/nsbatchdeleterequestresulttype
[NSPersistentHistoryResultType]: https://developer.apple.com/documentation/coredata/nspersistenthistoryresulttype
[NSBatchInsertRequestResultType]: https://developer.apple.com/documentation/coredata/nsbatchinsertrequestresulttype

Request class                      | ResultType                       | Result class
-----------------------------------|----------------------------------|-------------
[NSFetchRequest]                   | [NSFetchRequestResultType]       |
[NSAsynchronousFetchRequest]       | [NSFetchRequestResultType]       | [NSAsynchronousFetchResult]
[NSSaveChangesRequest]             |                                  |
[NSBatchUpdateRequest]             | [NSBatchUpdateRequestResultType] | [NSBatchUpdateResult]
[NSBatchDeleteRequest]             | [NSBatchDeleteRequestResultType] | [NSBatchDeleteResult]
[NSPersistentHistoryChangeRequest] | [NSPersistentHistoryResultType]  | [NSPersistentHistoryResult]
[NSBatchInsertRequest]             | [NSBatchInsertRequestResultType] | [NSBatchInsertResult]

## Results

Request | `[NSManagedObject]` | `[NSManagedObjectID]` | Count | `[String: Any]` | Status
--------|---------------------|-----------------------|-------|-----------------|-------
[NSFetchRequest]                   | + | + | + | + |
[NSAsynchronousFetchRequest]       | + | + |   | + |
[NSSaveChangesRequest]             |   |   |   |   |
[NSBatchUpdateRequest]             |   | + | + |   | +
[NSBatchDeleteRequest]             |   | + | + |   | +
[NSPersistentHistoryChangeRequest] |   | + | + |   | +
[NSBatchInsertRequest]             |   | + | + |   | +

> [NSPersistentHistoryChangeRequest] has many result types
