//
//  Facing.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/21/25.
//

import Foundation

enum Facing: Argument {
    case rotation(Rotation)
    case position(Position)
    case target(TargetSelector)
    
    func compileArgument() -> String {
        switch self {
        case .rotation(let rotation):
            return rotation.compileArgument()
        case .position(let position):
            return ArgumentGroup("facing", position).compileArgument()
        case .target(let target):
            return ArgumentGroup("facing", target).compileArgument()
        }
    }
}
