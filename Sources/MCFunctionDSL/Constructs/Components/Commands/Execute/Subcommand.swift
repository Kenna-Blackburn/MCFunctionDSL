//
//  Subcommand.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

extension Execute {
    enum Subcommand: Argument {
        case `as`(TargetSelector)
        case at(TargetSelector)
        case `if`(IfUnlessCondition)
        case unless(IfUnlessCondition)
        
        // TODO: in
        // TODO: align
        // TODO: anchored
        // TODO: facing
        // TODO: position
        // TODO: rotated
        
        var argumentBody: some Argument {
            switch self {
            case .at(let target):
                ArgumentGroup("at", target)
            case .as(let target):
                ArgumentGroup("as", target)
            case .if(let condition):
                ArgumentGroup("if", condition)
            case .unless(let condition):
                ArgumentGroup("unless", condition)
            }
        }
    }
}

extension Execute.Subcommand {
    enum IfUnlessCondition: Argument {
        case entity(TargetSelector)
        case block(Position, Block)
        
        // TODO: blocks
        // TODO: score
        
        var argumentBody: some Argument {
            switch self {
            case .entity(let target):
                ArgumentGroup("entity", target)
            case .block(let position, let block):
                ArgumentGroup("block", position, block)
            }
        }
        
        static func block(
            _ block: Block,
            isAt position: Position
        ) -> Self {
            return .block(position, block)
        }
    }
}
