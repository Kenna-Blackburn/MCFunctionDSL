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
    
    func compileArgument() -> String {
        return tagString
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

