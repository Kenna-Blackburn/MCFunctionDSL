//
//  Block.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/22/25.
//

// TODO: add BlockState

import Foundation

struct Block: Argument {
    let blockID: String
    
    init(_ blockID: String) {
        self.blockID = blockID
    }
    
    var argumentBody: some Argument {
        blockID
    }
}

extension Block: ExpressibleByStringLiteral {
    init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}
