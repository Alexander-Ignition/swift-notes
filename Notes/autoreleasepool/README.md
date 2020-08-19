# Swift autoreleasepool

Нужно ли использовать autoreleasepool в swift"?
Вы когда нибудь задавались вопросом?

Я всегда думал, что autoreleasepool нужно использовать вместе с NSObject, то есть autoreleasepool это легаси от Objective-C.

Но в этот раз я решил разобраться с этим вопросом полностью.

## Documentation

Начал я с документации [autoreleasepool(invoking:)](https://developer.apple.com/documentation/objectivec/2299644-autoreleasepool).

Как оказалось документации нет, но зато эта страница оказалась в разделе Objective-C Runtime. Из чего можно было подумать, что в чистом swift на autoreleasepool можно забить.

## Swift Source

Исходники [Darwin/ObjectiveC/ObjectiveC.swift](https://github.com/apple/swift/blob/master/stdlib/public/Darwin/ObjectiveC/ObjectiveC.swift#L165) также лежали в разделе относящемуся только к Objective-C Runtime.

## SwiftRocks

Подробный ответ я нашел в статье [@autoreleasepool uses in 2019 Swift](https://medium.com/swift2go/autoreleasepool-uses-in-2019-swift-9e8fd7b1cd3f) от Bruno Rocha.

Если вкратце то `autoreleasepool` нужно использовать только при работе с объектами Objective-C, которые предоставляют Apple фреймворки. Внутри реализации они вызывают на Objective-C класса метод `autorelease`, который уже и добавляет объект в `autoreleasepool`.

## Swift NSObject

Что ж, чтоб лучше это закрепить я решил воспроизвести это поведение на своём классе.

```swift
final class Object: NSObject {
    let id: Int

    init(id: Int) {
        self.id = id
        super.init()
        print(type(of: self), #function, id)
    }

    deinit {
        print(type(of: self), #function, id)
    }
}
```

```swift
func experiment0() {
    print("Swift NSObject")
    print("> start", #function)

    for i in 0..<3 {
        let object = Object(id: i)
        print(object)
    }

    print("> end", #function)
}
```
Эксперимент показал, что объект сразу уничтожается при обороте цикла.

```
Swift NSObject
> start experiment0()
Object init(id:) 0
<Pool.Object: 0x600000c586f0>
Object deinit 0
Object init(id:) 1
<Pool.Object: 0x600000c586f0>
Object deinit 1
Object init(id:) 2
<Pool.Object: 0x600000c586f0>
Object deinit 2
> end experiment0()
```

## Objective-C NSObject

Я попробовал написать аналогичный класс на Objective-C и подключил его через Bridging-Header.

```swift
func experiment1() {
    print("Objective-C NSObject")
    print("> start", #function)

    for i in 0..<3 {
        let object = LegacyObject(id: i)
        print(object)
    }

    print("> end", #function)
}
```

Объект также спокойно стал уничтожаться при оборотах цикла.

```
Objective-C NSObject
> start experiment1()
2020-08-19 10:33:36.823750+0300 Pool[21739:489625] -[LegacyObject initWithID:] ID = 0
<LegacyObject: 0x600000c586f0>
2020-08-19 10:33:36.823865+0300 Pool[21739:489625] -[LegacyObject dealloc] ID = 0
2020-08-19 10:33:36.823959+0300 Pool[21739:489625] -[LegacyObject initWithID:] ID = 1
<LegacyObject: 0x600000c4c060>
2020-08-19 10:33:36.824056+0300 Pool[21739:489625] -[LegacyObject dealloc] ID = 1
2020-08-19 10:33:36.824144+0300 Pool[21739:489625] -[LegacyObject initWithID:] ID = 2
<LegacyObject: 0x600000c405a0>
2020-08-19 10:33:36.824233+0300 Pool[21739:489625] -[LegacyObject dealloc] ID = 2
> end experiment1()
```

## Objective-C NSObject autorelease

Тут я решил отключить ARC в Objective-C, чтобы вызвать на объекте `autorelease`.

```objc
+ (LegacyObject *)createWithID:(NSInteger)ID
{
    return [[[self alloc] initWithID:ID] autorelease];
}
```

```swift
func experiment2() {
    print("Objective-C NSObject with autorelease")
    print("> start", #function)

    for i in 0..<3 {
        let object = LegacyObject.create(withID: i)
        print(object)
    }

    print("> end", #function)
}
```

И тут уже удалось воспроизвести поведение, когда объекты копятся в цикле и уничтожаются при обороте `RunLoop`.

```
Objective-C NSObject with autorelease
> start experiment2()
2020-08-19 10:33:36.824349+0300 Pool[21739:489625] -[LegacyObject initWithID:] ID = 0
<LegacyObject: 0x600000c586f0>
2020-08-19 10:33:37.071345+0300 Pool[21739:489625] -[LegacyObject initWithID:] ID = 1
<LegacyObject: 0x600000c4c060>
2020-08-19 10:33:37.071603+0300 Pool[21739:489625] -[LegacyObject initWithID:] ID = 2
<LegacyObject: 0x600000c4c050>
> end experiment2()

2020-08-19 10:33:37.088734+0300 Pool[21739:489625] -[LegacyObject dealloc] ID = 2
2020-08-19 10:33:37.088946+0300 Pool[21739:489625] -[LegacyObject dealloc] ID = 1
2020-08-19 10:33:37.089027+0300 Pool[21739:489625] -[LegacyObject dealloc] ID = 0
```

## Objective-C NSObject autoreleasepool

Чтобы ликвидировать накопление объектов в памяти я обернул тело цикла в `autoreleasepool`.

```swift
func experiment3() {
    print("Objective-C NSObject autoreleasepool")
    print("> start", #function)

    for i in 0..<3 {
        autoreleasepool {
            let object = LegacyObject.create(withID: i)
            print(object)
        }
    }

    print("> end", #function)
}
```

И уничтожение объектов вернулось к нормальному.

```
Objective-C NSObject autoreleasepool
> start experiment3()
2020-08-19 10:33:37.071791+0300 Pool[21739:489625] -[LegacyObject initWithID:] ID = 0
<LegacyObject: 0x600000c5c7c0>
2020-08-19 10:33:37.071960+0300 Pool[21739:489625] -[LegacyObject dealloc] ID = 0
2020-08-19 10:33:37.072102+0300 Pool[21739:489625] -[LegacyObject initWithID:] ID = 1
<LegacyObject: 0x600000c5c7c0>
2020-08-19 10:33:37.072197+0300 Pool[21739:489625] -[LegacyObject dealloc] ID = 1
2020-08-19 10:33:37.072339+0300 Pool[21739:489625] -[LegacyObject initWithID:] ID = 2
<LegacyObject: 0x600000c405a0>
2020-08-19 10:33:37.072447+0300 Pool[21739:489625] -[LegacyObject dealloc] ID = 2
> end experiment3()
```

## Вывод

Использование `autoreleasepool` в swift может понадобится только при работе с Objective-C классами, которые в своей реализации могли вызывать `autorelease`.
