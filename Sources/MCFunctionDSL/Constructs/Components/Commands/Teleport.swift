//
//  Teleport.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/21/25.
//

import Foundation

struct Teleport: MCComponent {
    let destination: Destination
    let target: TargetSelector?
    let facing: Facing?
    let checkForBlocks: Bool?
    
    init(
        _ target: TargetSelector? = nil,
        to destination: Destination,
        facing: Facing? = nil,
        checkForBlocks: Bool? = nil
    ) {
        self.destination = destination
        self.target = target
        self.facing = facing
        self.checkForBlocks = checkForBlocks
    }
    
    var componentBody: some MCComponent {
        Command(
            "tp",
            target,
            destination,
            facing,
            checkForBlocks
        )
    }
    
    init(
        _ target: TargetSelector? = nil,
        to destination: TargetSelector,
        facing: Facing? = nil,
        checkForBlocks: Bool? = nil
    ) {
        self.init(
            target,
            to: .target(destination),
            facing: facing,
            checkForBlocks: checkForBlocks
        )
    }
}

extension Teleport {
    enum Destination: Argument {
        case position(Position)
        case target(TargetSelector)
        
        var argumentBody: some Argument {
            switch self {
            case .position(let position):
                ArgumentGroup(position)
            case .target(let target):
                ArgumentGroup(target)
            }
        }
    }
}
