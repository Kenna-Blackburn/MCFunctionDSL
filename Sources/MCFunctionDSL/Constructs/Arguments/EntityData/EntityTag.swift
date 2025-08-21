//
//  EntityTag.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/21/25.
//

import Foundation

struct EntityTag: Argument {
    let tagString: String
    
    init(_ tagString: String) {
        self.tagString = tagString
    }
    
    var argumentBody: some Argument {
        tagString
    }
}

extension EntityTag:
    ExpressibleByStringLiteral,
    ExpressibleByStringInterpolation
{
    init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}

