//
//  SpawnEvent.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/21/25.
//

import Foundation

struct SpawnEvent: Argument {
    let eventString: String
    
    init(_ eventString: String) {
        self.eventString = eventString
    }
    
    func compileArgument() -> String {
        return eventString
    }
}

extension SpawnEvent: ExpressibleByStringLiteral {
    init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}
