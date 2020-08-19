//
//  Object.swift
//  Pool
//
//  Created by Alexander Ignatev on 19.08.2020.
//  Copyright © 2020 Alexandr Ignatyev. All rights reserved.
//

import Foundation

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
