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
    let namespace: String
    
    init(
        _ blockID: String,
        namespace: String = "minecraft"
    ) {
        self.blockID = blockID
        self.namespace = namespace
    }
    
    var argumentBody: some Argument {
        ArgumentGroup(namespace, ":", blockID)
            .unpaddingChildren()
    }
}

extension Block: ExpressibleByStringLiteral {
    init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}

extension Block {
    static let air: Self = "air"
    static let glass: Self = "glass"
}
