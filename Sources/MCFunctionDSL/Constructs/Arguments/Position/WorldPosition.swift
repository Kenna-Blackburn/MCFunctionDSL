//
//  WorldPosition.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/21/25.
//

import Foundation

extension Position {
    enum WorldPosition: Argument {
        case world(Double)
        case relative(Double?)
        
        var argumentBody: some Argument {
            switch self {
            case .world(let double):
                ArgumentGroup(double)
            case .relative(let double):
                ArgumentGroup("~", double)
                    .unpaddingChildren()
            }
        }
    }
}

extension Position.WorldPosition:
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
