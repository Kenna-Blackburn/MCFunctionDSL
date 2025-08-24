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
    
    var argumentBody: some Argument {
        switch self {
        case .rotation(let rotation):
            rotation.erase()
        case .position(let position):
            ArgumentGroup("facing", position)
        case .target(let target):
            ArgumentGroup("facing", target)
        }
    }
}
