//: # String and Data
import Foundation

let string1 = "Hello world"

//: ## `Data` from `String`

// func data(using encoding: Encoding, allowLossyConversion: Bool = false) -> Data?
let data1: Data? = string1.data(using: .utf8)

// init<S>(_ elements: S) where S : Sequence, S.Element == UInt8
let data2: Data = Data(string1.utf8)

//: ## `String` from `Data`

// init?(data: Data, encoding: Encoding)
let string2: String? = String(data: data2, encoding: .utf8)

// init?<S>(bytes: S, encoding: Encoding) where S : Sequence, S.Element == UInt8
let string3: String? = String(bytes: data2, encoding: .utf8)

// init<C, Encoding>(decoding codeUnits: C, as sourceEncoding: Encoding.Type) where C : Collection, Encoding : _UnicodeEncoding, C.Element == Encoding.CodeUnit
let string4: String = String(decoding: data2, as: UTF8.self)
