//
//  WorldPosition.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/21/25.
//

import Foundation

enum WorldPosition: Argument {
    case world(Double)
    case relative(Double?)
    
    func compileArgument() -> String {
        switch self {
        case .world(let double):
            return double.compileArgument()
        case .relative(let double):
            return ArgumentGroup("~", double)
                .unpaddingChildren()
                .compileArgument()
        }
    }
}

extension WorldPosition:
    ExpressibleByIntegerLiteral,
    ExpressibleByFloatLiteral,
    ExpressibleByNilLiteral
{
    init(integerLiteral value: IntegerLiteralType) {
        self = .world(Double(value))
    }
    
    init(floatLiteral value: FloatLiteralType) {
        self = .world(value)
    }
    
    init(nilLiteral: ()) {
        self = .relative(nil)
    }
}
